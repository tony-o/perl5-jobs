use utf8;
package DB::Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::User

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<users>

=cut

__PACKAGE__->table("users");

=head1 ACCESSORS

=head2 uid

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

=head2 usertype

  data_type: 'varchar'
  default_value: 'JS'
  is_nullable: 1
  size: 2

=head2 datecreated

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 1
  original: {default_value => \"now()"}

=cut

__PACKAGE__->add_columns(
  "uid",
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
  "usertype",
  { data_type => "varchar", default_value => "JS", is_nullable => 1, size => 2 },
  "datecreated",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 1,
    original      => { default_value => \"now()" },
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</uid>

=back

=cut

__PACKAGE__->set_primary_key("uid");


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2013-12-17 12:58:22
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:gPlCI+z2QNyWB8hIHyZ/ww


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
