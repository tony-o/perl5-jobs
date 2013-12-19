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

#do processing here for saving/updating DB
  my @q = $tqs->all;
  my @r = $trs->all;
  my $unanswered = 0;
  foreach my $q (@q) {
    ++$unanswered && last if !defined($self->param("q$q->id"));
  }

  if (!$unanswered) {
    #save these q's

  }

  $self->stash(
    container => {
      uid  => $user->uid,
      path => 'client/traits',
      a    => $unanswered,
      tqs  => [@q],
      trs  => [@r],
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
