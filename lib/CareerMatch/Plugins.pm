package CareerMatch::Plugins;
use DB::PKG;

sub setup {
  my (undef,$self) = @_;
  $self->secrets(['secr3t']);
  $self->plugin('authentication' => {
    'session_key'   => 'wtf',
    'load_user'     => \&CareerMatch::Auth::load_user,
    'validate_user' => \&CareerMatch::Auth::validate_user, 
  });
  $self->plugin('Human', {
    # Set money parameters if you need
    money_delim => ",",
    money_digit => " ",

    # Or change date and time strings
    datetime    => '%m/%d/%Y %H:%M',
    time        => '%H:%M',
    date        => '%m/%d/%Y',

    phone_country   => 1,
    phone_region    => 123,
  });
};


1;
