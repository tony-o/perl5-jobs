package CareerMatch;

use Mojo::Base qw<Mojolicious>;
use Mojolicious::Plugin::DefaultHelpers;

sub startup {
  my $self = shift;
  my $r    = $self->routes;
  
  $self->secret("secr3t");

  $r->route('/')->to(
    controller => 'Main',
    action     => 'main',
  );
};

1;
