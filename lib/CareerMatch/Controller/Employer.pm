package CareerMatch::Controller::Employer;
use Mojo::Base qw<Mojolicious::Controller>;
use DB::PKG;
use CareerMatch::Auth;

sub dashboard {
  my $self = shift;
  my $db = $DB::PKG::db;
  my $user = $self->current_user;
  $self->stash(
    container => {
      uid       => $user->uid,
      employers => [$user->uid, $user->domain, $user->username, $user->pass],
      path      => 'employer',
    }
  );
};

sub joblist {
  my $self = shift;
  my $db = $DB::PKG::db;
  my $user = $self->current_user;

  my $jobset = $DB::PKG::db->resultset('Job');
  my $jobs   = $jobset->search({domain => $user->domain});
  my @jobs;
  while (my $job = $jobs->next) {
    push @jobs, $job;
  }
  $self->stash(
    container => {
      uid  => $user,
      jobs => [@jobs],
      path => 'employer/joblist',
    }
  );
} 

sub jobpost {
  my $self = shift;
  my $db = $DB::PKG::db;
  my $user = $self->current_user;
  my $id = 0;
#NEED TO ADD AUTHORIZATION STUFF HERE
  if (defined($self->param('title')) && defined($self->param('description'))) {
    my $jobset = $db->resultset('Job');
    my $jobreq = $db->resultset('JobReqsPrecanned');
    my $ajreq  = $db->resultset('JobReq');
    my $post   = $jobset->new({
      title       => $self->param('title'),
      description => $self->param('description'),
      domain      => $user->domain,
      jobclass    => $self->param('jobclass'),
    });
    $post->insert;
    $id = $post->jid;

    # generate the job requirements;
    my @jobreqs = $jobreq->search({
      jid => $self->param('jobclass'),
    })->all;

    map {
      my $plusminus = $self->param('jmt' . $_->jmtid->id);
      $plusminus = 0 if $plusminus !~ m{^\-?\d+$};
      $ajreq->create({
        jmtid => $_->jmtid,
        jobid => $id,
        value => $_->value + $plusminus,
      });
    } @jobreqs;

    $self->redirect_to('/employer/joblist');
  }

  my @jcs  = $DB::PKG::db->resultset('Jobclass')->search(undef, { 
    order_by => { -asc => [qw<jid>] },    
  })->all;
  my @jcm  = $DB::PKG::db->resultset('Jobmatchtrait')->all;
  $self->stash(
    container => {
      uid        => $user->uid,
      path       => 'employer/jobpost',
      jid        => $id,
      jobclasses => [@jcs],
      jobmatchtr => [@jcm],
    }
  );
}

sub jobview {
  my $self = shift;
  my $db   = $DB::PKG::db;
  my $user = $self->current_user;
#NEED TO ADD AUTHORIZATION STUFF HERE
  my $jobset = $db->resultset('Job');
  my $jobmt  = $db->resultset('Jobmatch');
  my $biors  = $db->resultset('Bioanswer');
  my $bioqrs = $db->resultset('Bioquestion');
  my $post   = $jobset->search({jid => $self->stash->{id}, domain => $user->domain})->first;
  my @match  = $jobmt->search({jid => $self->stash->{id}}, { order_by => { -desc => 'fval' } })->all;
  my %bios;
  
  {
    my @bioids;
    my %keylookup;
    my @keyids;
    my @uids;
    my @trs = $bioqrs->search({ question => ['First Name','Last Name'] })->all;
    foreach (@trs) { $keylookup{$_->question} = $_->id; push @keyids, $_->id; }
    foreach my $m (@match) {
      push @uids, $m->uid->uid;
    }

    my @bioarr = $biors->search({ uid => [@uids] })->all;
    foreach (@bioarr) {
      $bios{ $_->uid->username } = { } if !defined($bios{ $_->uid->username });
      $bios{ $_->uid->username }->{'First Name'} = $_->val if $_->qid->id eq $keylookup{'First Name'};
      $bios{ $_->uid->username }->{'Last Name'} = $_->val if $_->qid->id eq $keylookup{'Last Name'};
    }

  }

  $self->stash(
    container => {
      uid     => $user->uid,
      path    => 'employer/joblist',
      job     => $post,
      matches => [@match],
      bios    => \%bios,
    }
  );
}


sub viewprofile {
  my $self = shift;
  my $user = $self->current_user;

  my $bioq = $DB::PKG::db->resultset('Bioquestion');
  my $bioa = $DB::PKG::db->resultset('Bioanswer');
  my $emp  = $DB::PKG::db->resultset('Employer');
  my $usr  = $DB::PKG::db->resultset('User');
  my $edu  = $DB::PKG::db->resultset('Education');

  my $denied = 1;
  my @questions;
  my %answers;
  my @employers;
  my @education;
  my $username;
  $denied = 0 if CareerMatch::Auth::role($user->uid, 'JOBVIEW');

  if (!$denied) { 
    my $uid = $self->stash->{id};
    @questions = $bioq->search(undef, {order_by => { -asc => [qw{weight}] }})->all;
    my @q;
    foreach (@questions) {
      push @q, $_->id;  
      $answers{$_->question} = '';
    }
    
    my @answera = $bioa->search({uid => $uid, qid => [@q]})->all;
    foreach (@answera) {
      $answers{$_->qid->question} = $_->val;
    }
    $username  = $usr->search({uid => $uid})->next->username;
    @employers = $emp->search({uid => $uid}, { order_by => { -asc => [qw{startdt}] }})->all;
    @education = $edu->search({uid => $uid}, { order_by => { -asc => [qw{degdt}] }})->all;
  }

  $self->stash(container => {
    questions => [@questions],
    answers   => \%answers, 
    education => [@education],
    employers => [@employers],
    path      => 'employer/viewprofile',
    denied    => $denied,
    username  => $username,
  });
}




sub emptyroute {
  my $self = shift;
  $self->redirect_to('/employer/dashboard');
  return 0;
};

1;
