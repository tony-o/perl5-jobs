package CareerMatch::Controller::Client;
use Mojo::Base qw<Mojolicious::Controller>;
use DB::PKG;

sub dashboard {
  my $self = shift;
  my $user = $self->current_user;
  $self->stash(
    container => {
      uid       => $user->uid,
      employers => [$user->uid, $user->domain, $user->username, $user->pass],
      path      => 'client',
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

  my $tanswers = $trr->search({uid => $user->id});

  my @answers;
  while (my $a = $tanswers->next) {
    push @answers, {qid => $a->qid->id, rid => $a->rid->id};
  }

#do processing here for saving/updating DB
  my @q = $tqs->all;
  my @r = $trs->all;
  my $answered = 0;
  if (+@q ne +@answers) {
    foreach my $qq (@q) {
      last if !defined($self->param('q'.$qq->id));
      $answered++;
    }
  }
  if ($answered == +@q && !+@answers) {
    #save these q's
    foreach my $qq (@q) {
      my ($id) = ($qq->id =~ /(\d+)/);
      $trr->update_or_create({
        uid => $user->uid,
        qid => $id,
        rid => $self->param("q$id"), 
      },{
        key => 'p_personalitytraits_uid_qid', 
      });
      push @answers, { qid => $id, rid => $self->param("q$id") };
    }

  }

  $self->stash(
    container => {
      uid  => $user->uid,
      path => 'client/traits',
      a    => $answered,
      tqs  => [@q],
      trs  => [@r],
      trr  => [@answers],
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

sub emptyroute {
  my $self = shift;
  $self->redirect_to('/client/dashboard');
  return 0;
};

1;
