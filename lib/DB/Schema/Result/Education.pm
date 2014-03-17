use utf8;
package DB::Schema::Result::Education;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::Education

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<education>

=cut

__PACKAGE__->table("education");

=head1 ACCESSORS

=head2 eid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'education_eid_seq'

=head2 uid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 institution

  data_type: 'varchar'
  is_nullable: 1
  size: 120

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

=head2 degreetype

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 degree

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 degdt

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 1
  original: {default_value => \"now()"}

=head2 linkedinid

  data_type: 'varchar'
  is_nullable: 1
  size: 20

=cut

__PACKAGE__->add_columns(
  "eid",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "education_eid_seq",
  },
  "uid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "institution",
  { data_type => "varchar", is_nullable => 1, size => 120 },
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
  "degreetype",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "degree",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "degdt",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 1,
    original      => { default_value => \"now()" },
  },
  "linkedinid",
  { data_type => "varchar", is_nullable => 1, size => 20 },
);

=head1 PRIMARY KEY

=over 4

=item * L</eid>

=back

=cut

__PACKAGE__->set_primary_key("eid");

=head1 UNIQUE CONSTRAINTS

=head2 C<p_education_linkedinid>

=over 4

=item * L</linkedinid>

=back

=cut

__PACKAGE__->add_unique_constraint("p_education_linkedinid", ["linkedinid"]);

=head1 RELATIONS

=head2 degreetype

Type: belongs_to

Related object: L<DB::Schema::Result::Degreetype>

=cut

__PACKAGE__->belongs_to(
  "degreetype",
  "DB::Schema::Result::Degreetype",
  { did => "degreetype" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

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


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-03-16 17:26:45
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:pddYcOQm8K5kVkshobZUCQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
