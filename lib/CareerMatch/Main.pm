package CareerMatch::Main;
BEGIN { unshift @INC, '../lib'; }
use Mojo::Base qw<Mojolicious::Controller>;
use lib '..';
use Config::General;
use DB::Schema;
use Data::Dumper;
my $conf   = Config::General->new('./lib/DB/db.cnf');
my %config = $conf->getall;
my $db     = DB::Schema->connect( 
                                 "dbi:Pg:dbname=\"" . $config{postgres}{db} . 
                                   '";host=' . $config{postgres}{host}, 
                                 $config{postgres}{user}, 
                                 $config{postgres}{pass}, 
                                 { } 
                                ) or die $!;

sub main {
  glob $db;
  my $self = shift;
  my @vendors = $db->resultset('Vendor')->all;
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

1;
