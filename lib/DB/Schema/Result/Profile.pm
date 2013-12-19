use utf8;
package DB::Schema::Result::Profile;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::Profile

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<profiles>

=cut

__PACKAGE__->table("profiles");

=head1 ACCESSORS

=head2 pid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'profiles_pid_seq'

=head2 uid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 firstname

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 lastname

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 address1

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 address2

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 city

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 state

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 postalcode

  data_type: 'varchar'
  is_nullable: 1
  size: 11

=head2 phone

  data_type: 'varchar'
  is_nullable: 1
  size: 10

=head2 relocateok

  data_type: 'boolean'
  is_nullable: 1

=head2 salarylow

  data_type: 'integer'
  is_nullable: 1

=head2 salaryhigh

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "pid",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "profiles_pid_seq",
  },
  "uid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "firstname",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "lastname",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "address1",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "address2",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "city",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "state",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "postalcode",
  { data_type => "varchar", is_nullable => 1, size => 11 },
  "phone",
  { data_type => "varchar", is_nullable => 1, size => 10 },
  "relocateok",
  { data_type => "boolean", is_nullable => 1 },
  "salarylow",
  { data_type => "integer", is_nullable => 1 },
  "salaryhigh",
  { data_type => "integer", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</pid>

=back

=cut

__PACKAGE__->set_primary_key("pid");

=head1 UNIQUE CONSTRAINTS

=head2 C<profiles_uid_key>

=over 4

=item * L</uid>

=back

=cut

__PACKAGE__->add_unique_constraint("profiles_uid_key", ["uid"]);

=head1 RELATIONS

=head2 state

Type: belongs_to

Related object: L<DB::Schema::Result::State>

=cut

__PACKAGE__->belongs_to(
  "state",
  "DB::Schema::Result::State",
  { id => "state" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 uid

Type: belongs_to

Related object: L<DB::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "uid",
  "DB::Schema::Result::User",
  { uid => "uid" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2013-12-18 17:00:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:u91bav/L7Z2vg0cl8sCBqQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
