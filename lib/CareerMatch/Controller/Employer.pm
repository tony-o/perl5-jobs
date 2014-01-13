package CareerMatch::Controller::Employer;
use Mojo::Base qw<Mojolicious::Controller>;
use DB::PKG;

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
      uid  => $user->uid,
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
    my $post   = $jobset->new({
      title       => $self->param('title'),
      description => $self->param('description'),
      domain      => $user->domain,
    });
    $post->insert;
    $id = $post->jid;
    $self->redirect_to('/employer/joblist');
  }

  $self->stash(
    container => {
      uid  => $user->uid,
      path => 'employer/jobpost',
      jid  => $id,
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
  my $post   = $jobset->search({jid => $self->stash->{id}, domain => $user->domain});
  my @match  = $jobmt->search({jid => $self->stash->{id}}, { order_by => { -asc => 'fval' } })->all;
  $post      = $post->next;

  $self->stash(
    container => {
      uid     => $user->uid,
      path    => 'employer/joblist',
      job     => $post,
      matches => [@match],
    }
  );
}


sub emptyroute {
  my $self = shift;
  $self->redirect_to('/employer/dashboard');
  return 0;
};

1;
