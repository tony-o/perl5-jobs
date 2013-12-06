use utf8;
package DB::Schema::Result::Vendor;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::Vendor

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<vendors>

=cut

__PACKAGE__->table("vendors");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'vendors_id_seq'

=head2 domain

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 username

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 pass

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "vendors_id_seq",
  },
  "domain",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "username",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "pass",
  { data_type => "varchar", is_nullable => 0, size => 128 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2013-12-05 18:56:00
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:dfblM7e+RMHbEx6wp/z15Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
