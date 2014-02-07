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
  foreach (@questions) { push @qids, $_->id; };
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
    #columns  => [qw<eid institution city state degreetype degdt address1 address2 postalcode phone degree>],
    order_by => { -asc => [qw<degdt eid>], }
  });
  my @education;
  my @states;
  my @degreetypes;

  if (defined($self->param('institution'))) {
    my $hash_ref = {
      uid         => $user->uid,
      institution => $self->param('institution'),
      degree      => $self->param('jobtitle'),
      city        => $self->param('city'),
      state       => $self->param('state'),
      degreetype  => $self->param('jobclass'),
      degdt       => $self->param('dtobtained'),
    };

    if ($self->param('eid') =~ m<[0-9]+>) {
      my $count = $emrs->search({eid => $self->param('eid'), uid => $user->uid})->count;
      $hash_ref->{eid} = $self->param('eid') if $count;
    }
    my $v = $emrs->update_or_new($hash_ref);
    $v->insert if !$v->in_storage;
  }

  if (defined($self->param('delete'))) {
    $emrs->search({
      uid => $user->uid,
      eid => $self->param('delete'),
    })->delete;
  }

  @education = $eds->all;

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
    order_by => { -asc => [qw<startdt>], },
  });
  my @employers;
  my @states;
  my @jobclasses;

  if (defined($self->param('employer'))) {
    my $hash_ref = {
      uid         => $user->uid,
      employer    => $self->param('employer'),
      jobtitle    => $self->param('jobtitle'),
      city        => $self->param('city'),
      state       => $self->param('state'),
      jobclass    => $self->param('jobclass'),
      startdt     => $self->param('startdt'),
      enddt       => $self->param('enddt') || undef,
      contactok   => $self->param('contactok') || 0,
      phonenumber => $self->param('phonenumber') || undef,
    };
    if ($self->param('eid') =~ m<[0-9]+>) {
      my $count = $emrs->search({eid => $self->param('eid'), uid => $user->uid})->count;
      $hash_ref->{eid} = $self->param('eid') if $count;
    }
    my $v = $emrs->update_or_new($hash_ref);
    $v->insert if !$v->in_storage;
  }

  if (defined($self->param('delete'))) {
    $emrs->search({uid => $user->uid, eid => $self->param('delete')})->delete;
  }

  @employers = $ems->all;

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
    my ($q)    = $questions->search({testname => $self->param('test'), id => $self->param('q')}, {order_by => { -asc => [qw{weight}] } })->first;
    try {
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
    };
  }

  my @answered;
  my $qu;
  {
    my @q = $questions->search({testname => $self->param('test')})->all;
    foreach (@q) {
      if ($traits->search({ uid => $user->uid, qid => $_->id })->count > 0) {
        #say Dumper $_->id;
        push @answered, $_->id;
        $qno++;
      } else {
        $qu = $_;
        last;
      }
    }
  }
  
  say Dumper \@answered;
  my $q = $qu;
  say Dumper $q;
  my @r;
  if (defined($q) && scalar(@errors) == 0) {
    @r   = $responses->search({testname => $self->param('test'), set => $q->set}, {order_by => { -asc => [qw{weight}] }})->all; 
  }


  my @questions = $questions->search({testname => 'personality'})->all;
  my @qids;
  foreach (@questions) { push @qids, $_->id; };
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

sub bio {
  my $self = shift;
  my $user = $self->current_user;

  my $bioq = $DB::PKG::db->resultset('Bioquestion');
  my $bioa = $DB::PKG::db->resultset('Bioanswer');

  my @questions = $bioq->search(undef, {order_by => { -asc => [qw{weight}] }})->all;
  my @messages;
  my %answers;
  my @q;

  foreach (@questions) {
    push @q, $_->id;  
  }

  if (defined($self->param('q' . $q[0]))) {
    foreach (@q) {
      $bioa->update_or_create({
        uid => $user->id,
        qid => $_,
        val => $self->param('q' . $_),
      },{
        key => 'p_bioanswers_uid_qid',
      });
    }
    push @messages, 'SUCCESSFULUPDATE';
  }

  my @answera = $bioa->search({uid => $user->uid, qid => [@q]})->all;
  foreach (@answera) {
    $answers{$_->qid->question} = $_->val;
  }

  $self->stash(container => {
    questions => [@questions],
    messages  => [@messages],
    answers   => \%answers, 
    uid       => $user->uid,
    path     => 'client/bio',
  });
}

sub biopreview {
  my $self = shift;
  my $user = $self->current_user;

  my $bioq = $DB::PKG::db->resultset('Bioquestion');
  my $bioa = $DB::PKG::db->resultset('Bioanswer');
  my $emp  = $DB::PKG::db->resultset('Employer');
  my $edu  = $DB::PKG::db->resultset('Education');

  my @questions = $bioq->search(undef, {order_by => { -asc => [qw{weight}] }})->all;
  my @q;
  my %answers;
  foreach (@questions) {
    push @q, $_->id;  
    $answers{$_->question} = '';
  }
  
  my @answera = $bioa->search({uid => $user->uid, qid => [@q]})->all;
  foreach (@answera) {
    $answers{$_->qid->question} = $_->val;
  }

  my @employers = $emp->search({uid => $user->uid}, { order_by => { -asc => [qw{startdt}] }})->all;
  my @education = $edu->search({uid => $user->uid}, { order_by => { -asc => [qw{degdt}] }})->all;

  $self->stash(container => {
    questions => [@questions],
    answers   => \%answers, 
    education => [@education],
    employers => [@employers],
    path     => 'client/biopreview',
  });
}

sub emptyroute {
  my $self = shift;
  $self->redirect_to('/jobseeker/dashboard');
  return 0;
};

1;
