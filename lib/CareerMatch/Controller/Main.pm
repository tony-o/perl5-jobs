package CareerMatch::Controller::Main;
use Mojo::Base qw<Mojolicious::Controller>;
use DB::PKG;

my $vendors = $DB::PKG::db->resultset('User');

sub main {
  glob $vendors;
  my $self = shift;
  my @vendors = $vendors->all;
  my @vendor_list;
  foreach my $vendor (@vendors) {
    push @vendor_list, "${\$vendor->id} :: ${\$vendor->username}\@${\$vendor->domain}";
  }
  $self->stash(
    container => {
      data => { vendors => [@vendor_list] },
    }
  );
};

sub login {
  glob $vendors;
  my $self = shift;
  $self->logout;
  my $return = $self->authenticate($self->param('username'), $self->param('password')) if $self->param('username') && $self->param('password');
  $self->redirect_to($self->session->{'eventually'}) if $return;
  $self->stash(
    container => {
      user => [$return]
    }
  );
};

1;
