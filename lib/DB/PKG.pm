package DB::PKG;

use Config::General;
use DB::Schema;

my  $conf   = Config::General->new('./lib/DB/db.cnf');
my  %config = $conf->getall;
our $db     = DB::Schema->connect( 
                                 "dbi:Pg:dbname=\"" . $config{postgres}{db} . 
                                   '";host=' . $config{postgres}{host}, 
                                 $config{postgres}{user}, 
                                 $config{postgres}{pass}, 
                                 { } 
                                ) or die $!;

