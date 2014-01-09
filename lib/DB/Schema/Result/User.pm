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
  { 
    "data_type" => "varchar",
    "is_nullable" => 0,
    "size" => 128,
  },
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

=head1 RELATIONS

=head2 educations

Type: has_many

Related object: L<DB::Schema::Result::Education>

=cut

__PACKAGE__->has_many(
  "educations",
  "DB::Schema::Result::Education",
  { "foreign.uid" => "self.uid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 employers

Type: has_many

Related object: L<DB::Schema::Result::Employer>

=cut

__PACKAGE__->has_many(
  "employers",
  "DB::Schema::Result::Employer",
  { "foreign.uid" => "self.uid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 personalitytraits

Type: has_many

Related object: L<DB::Schema::Result::Personalitytrait>

=cut

__PACKAGE__->has_many(
  "personalitytraits",
  "DB::Schema::Result::Personalitytrait",
  { "foreign.uid" => "self.uid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 profile

Type: might_have

Related object: L<DB::Schema::Result::Profile>

=cut

__PACKAGE__->might_have(
  "profile",
  "DB::Schema::Result::Profile",
  { "foreign.uid" => "self.uid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2013-12-18 17:00:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:RiFcnJD1kDAE7vao2+SusQ

# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->add_columns(
  "pass", {
    "passphrase"       => 'rfc2307',
    "passphrase_class" => 'SaltedDigest',
      "passphrase_args"  => {
      "algorithm"   => 'SHA-1',
      "salt_random" => 20.
    },
    "passphrase_check_method" => 'check_password',
  },
);

1;
