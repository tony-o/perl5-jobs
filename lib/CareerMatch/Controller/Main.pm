package CareerMatch::Controller::Main;
use Mojo::Base qw<Mojolicious::Controller>;
use DB::PKG;
use CareerMatch::Auth;

sub main {
  my $self = shift;
  my $vendors = $DB::PKG::db->resultset('User');
  my $user = $self->current_user;
  my @vendors = $vendors->all;
  my @vendor_list;
  foreach my $vendor (@vendors) {
    push @vendor_list, "${\$vendor->id} :: ${\$vendor->username}\@${\$vendor->domain}";
  }
  $self->stash(
    container => {
      uid  => $user,
      data => { vendors => [@vendor_list] },
      path => 'home',
    }
  );
};

sub login {
  my $self = shift;
  $self->logout;
  my $return = $self->authenticate($self->param('username'), $self->param('password')) if $self->param('username') && $self->param('password');
  $self->redirect_to($self->session->{'eventually'}) if $return;
  $self->stash(
    container => {
      user => [$return],
      path => 'login',
    }
  );
};

sub register {
  my $self = shift;
  #my $return = $self->authenticate($self->param('username'), $self->param('password')) if $self->param('username') && $self->param('password');

  my $data = {
    u => $self->param('username'),
    p => $self->param('password'),
    t => (defined($self->param('isemployer')) && defined($self->param('isjobseeker')) && $self->param('isemployer') eq '1' && $self->param('isjobseeker') eq '1') ? 'JE' : (defined($self->param('isemployer')) && $self->param('isemployer') eq '1') ? 'EM' : 'JS',
  };

  my $user_exists = &CareerMatch::Auth::check_user($data->{u}); 
  my $rval;
  if (!defined($user_exists)) { 
    $rval = &CareerMatch::Auth::register_user($data);
    if (defined($rval) && $rval > 0) {
      #successful registration
      $self->redirect_to('/employer') if $data->{t} eq 'EM';
      $self->redirect_to('/client') if $data->{t} eq 'JS' || $data->{t} eq 'JE';
    }
  }
  $self->stash(
    container => {
      errors => ['USEREXISTS'],
      rval   => $rval,
      data   => $data,
      path   => 'register',
    }
  );
};

1;
