package CareerMatch::Controller::Employer;
use Mojo::Base qw<Mojolicious::Controller>;

sub dashboard {
  my $db = $CareerMatch::db;
  my $self = shift;
  my $user = $self->current_user;
  $self->stash(
    container => {
      uid       => $user->uid,
      employers => [$user->uid, $user->domain, $user->username, $user->pass],
      path      => 'employer',
    }
  );
};


sub emptyroute {
  my $self = shift;
  $self->redirect_to('/employer/dashboard');
  return 0;
};

1;
