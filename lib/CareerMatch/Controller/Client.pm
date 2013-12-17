package CareerMatch::Controller::Client;
use Mojo::Base qw<Mojolicious::Controller>;

sub dashboard {
  my $db = $CareerMatch::db;
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


sub emptyroute {
  my $self = shift;
  $self->redirect_to('/client/dashboard');
  return 0;
};

1;
