package CareerMatch::Routing;
use CareerMatch::Auth;

sub setup {
  my (undef,$self) = @_;
  my $r = $self->routes;
  
  #VENDOR ROUTING
  my $vendors = $r->bridge('/vendor')->to('Auth#check');
  $vendors->route('/')->to('Controller::Vendor#emptyroute');
  $vendors->route('/dashboard')->to('Controller::Vendor#dashboard');

  #MAIN ROUTES
  $r->route('/login')->to('Controller::Main#login');
  $r->route('/')->to('Controller::Main#main');
};


1;
