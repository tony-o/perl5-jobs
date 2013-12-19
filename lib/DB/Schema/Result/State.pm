use utf8;
package DB::Schema::Result::State;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::State

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<states>

=cut

__PACKAGE__->table("states");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'states_id_seq'

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 60

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "states_id_seq",
  },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 60 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 educations

Type: has_many

Related object: L<DB::Schema::Result::Education>

=cut

__PACKAGE__->has_many(
  "educations",
  "DB::Schema::Result::Education",
  { "foreign.state" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 employers

Type: has_many

Related object: L<DB::Schema::Result::Employer>

=cut

__PACKAGE__->has_many(
  "employers",
  "DB::Schema::Result::Employer",
  { "foreign.state" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 profiles

Type: has_many

Related object: L<DB::Schema::Result::Profile>

=cut

__PACKAGE__->has_many(
  "profiles",
  "DB::Schema::Result::Profile",
  { "foreign.state" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2013-12-18 17:00:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:D/16AKub4wbK2MiZIQAL4g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
