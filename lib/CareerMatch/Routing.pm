package CareerMatch::Routing;
use CareerMatch::Auth;

sub setup {
  my (undef,$self) = @_;
  my $r = $self->routes;

  $r->cache(0);
  #VENDOR ROUTING
  my $employers = $r->bridge('/employer')->to('Auth#check');
  $employers->route('/')->to('Controller::Employer#emptyroute');
  $employers->route('/dashboard')->to('Controller::Employer#dashboard');
  $employers->route('/joblist')->to('Controller::Employer#joblist');
  $employers->route('/jobpost')->to('Controller::Employer#jobpost');
  $employers->route('/jobview/:id')->to('Controller::Employer#jobview');

  #CLIENT ROUTING
  my $clients = $r->bridge('/client')->to('Auth#check');
  $clients->route('/')->to('Controller::Client#emptyroute');
  $clients->route('/dashboard')->to('Controller::Client#dashboard');

  #MAIN ROUTES
  $r->route('/login')->to('Controller::Main#login');
  $r->route('/register')->to('Controller::Main#register');
  $r->route('/')->to('Controller::Main#main');
};


1;
