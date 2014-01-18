package CareerMatch::Controller::Client;
use Mojo::Base qw<Mojolicious::Controller>;
use Try::Tiny;
use DB::PKG;

sub dashboard {
  my $self = shift;
  my $user = $self->current_user;
  $self->stash(
    container => {
      uid  => $user->uid,
      employers => [$user->uid, $user->domain, $user->username, $user->pass],
      path => 'client',
    }
  );
};

sub calcprofile {
  my $uid = shift;
  my $db  = $DB::PKG::db;

  my $perccomplete = 0;
  my $traits = $db->resultset('Personalitytrait');
  my $emps   = $db->resultset('Employer');
  my $edus   = $db->resultset('Education');
  
  $perccomplete += 34 if $traits->search({ uid => $uid })->count;
  $perccomplete += 33 if $emps->search  ({ uid => $uid })->count;
  $perccomplete += 33 if $edus->search  ({ uid => $uid })->count;

  return $perccomplete;
}

sub traits {
  my $self = shift;
  my $user = $self->current_user;
  my $tqs  = $DB::PKG::db->resultset('Personalityquestion');
  my $trs  = $DB::PKG::db->resultset('Personalityresponse');
  my $trr  = $DB::PKG::db->resultset('Personalitytrait');

  my @questions = $tqs->search({testname => 'personality'})->all;
  my @qids;
  for (@questions) { push @qids, $_->id; };
  my $answered = $trr->search({uid => $user->id, qid => [@qids]})->count;


  $self->stash(
    container => {
      uid  => $user->uid,
      path => 'client/traits',
      answered => $answered,
      questions => [@questions],
    }
  );
};

sub education {
  my $self = shift;
  my $user = $self->current_user;
  my $emrs = $DB::PKG::db->resultset('Education');
  my @stts = $DB::PKG::db->resultset('State')->all;
  my @dtyp = $DB::PKG::db->resultset('Degreetype')->search(undef, {
    order_by => { -asc => [qw<did>] },
  })->all;
  my $eds  = $emrs->search({uid => $user->uid},{
    columns  => [qw<eid institution city state degreetype degdt>],
    order_by => { -asc => [qw<degdt eid>], }
  });
  my @education;
  my @states;
  my @degreetypes;

  if (defined($self->param('institution'))) {
    $emrs->create({
      uid         => $user->uid,
      institution => $self->param('institution'),
      degree      => $self->param('jobtitle'),
      city        => $self->param('city'),
      state       => $self->param('state'),
      degreetype  => $self->param('jobclass'),
      degdt       => $self->param('dtobtained'),
    });
  }

  while (my $e = $eds->next) {
    push @education, {
      eid         => $e->eid,
      institution => $e->institution,
      city        => $e->city,
      state       => $e->state->name,
      degreetype  => $e->degreetype->name,
      degree      => $e->degree,
      degdt       => $e->degdt,
    };
  }
  foreach my $s (@dtyp) {
    push @degreetypes, {
      did => $s->did,
      name => $s->name,
    };
  }
  foreach my $s (@stts) {
    push @states, {
      id => $s->id,
      name => $s->name,
    };
  }

  $self->stash(
    container => {
      uid         => $user->uid,
      path        => 'client/education',
      education   => [@education],
      states      => [@states],
      degreetypes => [@degreetypes],
    }
  );
};



sub employers {
  my $self = shift;
  my $user = $self->current_user;
  my $emrs = $DB::PKG::db->resultset('Employer');
  my @stts = $DB::PKG::db->resultset('State')->all;
  my @jcs  = $DB::PKG::db->resultset('Jobclass')->search(undef, { 
    order_by => { -asc => [qw<jid>] },    
  })->all;
  my $ems  = $emrs->search({uid => $user->uid},{
    columns  => [qw<eid employer jobtitle city state jobclass startdt enddt>],
    order_by => { -asc => [qw<startdt>], },
  });
  my @employers;
  my @states;
  my @jobclasses;

  if (defined($self->param('employer'))) {
    $emrs->create({
      uid      => $user->uid,
      employer => $self->param('employer'),
      jobtitle => $self->param('jobtitle'),
      city     => $self->param('city'),
      state    => $self->param('state'),
      jobclass => $self->param('jobclass'),
      startdt  => $self->param('startdt'),
      enddt    => $self->param('enddt'),
    });
  }

  while (my $e = $ems->next) {
    push @employers, {
      eid      => $e->eid,
      employer => $e->employer,
      jobtitle => $e->jobtitle,
      city     => $e->city,
      state    => $e->state->name,
      jobclass => $e->jobclass->name,
      startdt  => $e->startdt,
      enddt    => $e->enddt, 
    };
  }
  foreach my $s (@jcs) {
    push @jobclasses, {
      jid => $s->jid,
      name => $s->name,
      hdr => $s->isheader,
    };
  }
  foreach my $s (@stts) {
    push @states, {
      id => $s->id,
      name => $s->name,
    };
  }

  $self->stash(
    container => {
      uid  => $user->uid,
      path => 'client/employers',
      employers => [@employers],
      states => [@states],
      jobclasses => [@jobclasses],
    }
  );
};

sub profile {
  my $self = shift;
  my $user = $self->current_user;
  my $urs  = $DB::PKG::db->resultset('User');
  
  #number of training,employers
  my $perc = calcprofile $user->uid;

  $self->stash(
    container => {
      uid  => $user->uid,
      path => 'client/profile',
      perc => $perc,
    }
  );
};

sub question {
  my $self = shift;
  my $user = $self->current_user;
  my $questions = $DB::PKG::db->resultset('Personalityquestion');
  my $responses = $DB::PKG::db->resultset('Personalityresponse');
  my $traits    = $DB::PKG::db->resultset('Personalitytrait');

  my $qno = 0;

  my @errors;
  if (defined($self->param('response')) && defined($self->param('q'))) {
    # save response - 
    my ($q)    = $questions->search({testname => $self->param('test')}, {order_by => { -asc => [qw{weight}] } })->slice($self->param('q'));
    my ($rid)  = $responses->search({testname => $self->param('test'), set => $q->set, fval => $self->param('response')})->all;
    push @errors, 'INVALIDRESPONSE' if not(defined($user->uid) && defined($q) && defined($rid));
    try { 
      $traits->create({
        uid => $user->uid,
        qid => $q->id,
        rid => $rid->id, 
      }) if scalar(@errors) == 0;
    } catch {
      push @errors, 'ALREADYANSWERED';
    };
    $qno = $self->param('q') + 1 if scalar(@errors) == 0;
    say $qno;
  }

  {
    my @q = $questions->search({testname => $self->param('test')}, {order_by => { -asc => [qw{weight}]}})->all;
    for (@q) {
      if ($traits->search({ uid => $user->uid, qid => $_->id })->count > 0) {
        $qno++;
      } else {
        last;
      }
    }
  }
  
  my ($q) = $questions->search({testname => $self->param('test')}, {order_by => { -asc => [qw{weight}] } })->slice($qno);
  my @r;
  if (defined($q) && scalar(@errors) == 0) {
    @r   = $responses->search({testname => $self->param('test'), set => $q->set}, {order_by => { -asc => [qw{weight}] }})->all; 
  }


  my @questions = $questions->search({testname => 'personality'})->all;
  my @qids;
  for (@questions) { push @qids, $_->id; };
  my $answered = $traits->search({uid => $user->id, qid => [@qids]})->count;
 
  $self->stash(container => {
    uid => $user->uid,
    errors => [@errors],
    path => 'client/question',
    question  => $q,
    responses => [@r],
    q => $qno,
    test => $self->param('test'),
    answered => $answered,
    tquestions => scalar(@questions),
  });
}

sub emptyroute {
  my $self = shift;
  $self->redirect_to('/jobseeker/dashboard');
  return 0;
};

1;
