use utf8;
package DB::Schema::Result::Skillsuser;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::Skillsuser

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<skillsuser>

=cut

__PACKAGE__->table("skillsuser");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'skillsuser_id_seq'

=head2 sid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 uid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 linkedinid

  data_type: 'varchar'
  is_nullable: 1
  size: 16

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "skillsuser_id_seq",
  },
  "sid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "uid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "linkedinid",
  { data_type => "varchar", is_nullable => 1, size => 16 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<skillsuser_linkedinid_key>

=over 4

=item * L</linkedinid>

=back

=cut

__PACKAGE__->add_unique_constraint("skillsuser_linkedinid_key", ["linkedinid"]);

=head1 RELATIONS

=head2 sid

Type: belongs_to

Related object: L<DB::Schema::Result::Skillslist>

=cut

__PACKAGE__->belongs_to(
  "sid",
  "DB::Schema::Result::Skillslist",
  { id => "sid" },
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


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-04-01 17:26:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:a8ZgISjX7hTV/PF1vtjWKQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
