use utf8;
package DB::Schema::Result::Degreetype;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::Degreetype

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<degreetypes>

=cut

__PACKAGE__->table("degreetypes");

=head1 ACCESSORS

=head2 did

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'degreetypes_did_seq'

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 40

=cut

__PACKAGE__->add_columns(
  "did",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "degreetypes_did_seq",
  },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 40 },
);

=head1 PRIMARY KEY

=over 4

=item * L</did>

=back

=cut

__PACKAGE__->set_primary_key("did");

=head1 RELATIONS

=head2 educations

Type: has_many

Related object: L<DB::Schema::Result::Education>

=cut

__PACKAGE__->has_many(
  "educations",
  "DB::Schema::Result::Education",
  { "foreign.degreetype" => "self.did" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2014-01-02 10:52:37
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:LMLNj8ch1kuYqIlM06QBPA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
