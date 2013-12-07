package CareerMatch::Controller::Vendor;
use Mojo::Base qw<Mojolicious::Controller>;

sub dashboard {
  my $db = $CareerMatch::db;
  my $self = shift;
  my $user = $self->current_user;
  $self->stash(
    container => {
      vendors => [$user->uid, $user->domain, $user->username, $user->pass],
    }
  );
};


sub emptyroute {
  my $self = shift;
  $self->redirect_to('/vendor/dashboard');
  return 0;
};

1;
