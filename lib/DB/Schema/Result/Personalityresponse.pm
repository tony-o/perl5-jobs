use utf8;
package DB::Schema::Result::Personalityresponse;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::Personalityresponse

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<personalityresponses>

=cut

__PACKAGE__->table("personalityresponses");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'personalityresponses_id_seq'

=head2 response

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 weight

  data_type: 'integer'
  is_nullable: 1

=head2 testname

  data_type: 'varchar'
  is_nullable: 1
  size: 20

=head2 set

  data_type: 'integer'
  is_nullable: 1

=head2 fval

  data_type: 'double precision'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "personalityresponses_id_seq",
  },
  "response",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "weight",
  { data_type => "integer", is_nullable => 1 },
  "testname",
  { data_type => "varchar", is_nullable => 1, size => 20 },
  "set",
  { data_type => "integer", is_nullable => 1 },
  "fval",
  { data_type => "double precision", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 personalitytraits

Type: has_many

Related object: L<DB::Schema::Result::Personalitytrait>

=cut

__PACKAGE__->has_many(
  "personalitytraits",
  "DB::Schema::Result::Personalitytrait",
  { "foreign.rid" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2014-01-17 12:53:24
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:e5TI/5YiLO4mVpsT1NP+Bw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
