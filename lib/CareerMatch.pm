package CareerMatch;

use Mojo::Base qw<Mojolicious>;
use CareerMatch::Auth;
use CareerMatch::Plugins;
use CareerMatch::Routing;

sub startup {
  my $self = shift;
  my $r    = $self->routes;

  CareerMatch::Plugins->setup($self);  
  CareerMatch::Routing->setup($self);
};

1;
