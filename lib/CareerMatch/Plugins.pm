package CareerMatch::Plugins;
use DB::PKG;

sub setup {
  my (undef,$self) = @_;
  $self->secret("secr3t");
  $self->plugin('authentication' => {
    'session_key'   => 'wtf',
    'load_user'     => \&CareerMatch::Auth::load_user,
    'validate_user' => \&CareerMatch::Auth::validate_user, 
  });
};


1;
