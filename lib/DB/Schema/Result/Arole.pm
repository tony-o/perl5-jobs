use utf8;
package DB::Schema::Result::Arole;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::Arole

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<aroles>

=cut

__PACKAGE__->table("aroles");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'aroles_id_seq'

=head2 rid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 uid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "aroles_id_seq",
  },
  "rid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "uid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<p_aroles_rid_uid>

=over 4

=item * L</rid>

=item * L</uid>

=back

=cut

__PACKAGE__->add_unique_constraint("p_aroles_rid_uid", ["rid", "uid"]);

=head1 RELATIONS

=head2 rid

Type: belongs_to

Related object: L<DB::Schema::Result::Role>

=cut

__PACKAGE__->belongs_to(
  "rid",
  "DB::Schema::Result::Role",
  { id => "rid" },
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


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2014-01-20 15:18:46
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Ngxw+11l3GZboywxLDrpNw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
