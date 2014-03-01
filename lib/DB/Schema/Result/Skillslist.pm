use utf8;
package DB::Schema::Result::Skillslist;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::Skillslist

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<skillslist>

=cut

__PACKAGE__->table("skillslist");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'skillslist_id_seq'

=head2 skill

  data_type: 'varchar'
  is_nullable: 1
  size: 40

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "skillslist_id_seq",
  },
  "skill",
  { data_type => "varchar", is_nullable => 1, size => 40 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 skillsusers

Type: has_many

Related object: L<DB::Schema::Result::Skillsuser>

=cut

__PACKAGE__->has_many(
  "skillsusers",
  "DB::Schema::Result::Skillsuser",
  { "foreign.sid" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-02-28 15:26:33
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:JDlE5DaTVsVWwSYuRsag1A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
