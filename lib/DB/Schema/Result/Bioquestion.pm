use utf8;
package DB::Schema::Result::Bioquestion;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::Bioquestion

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<bioquestions>

=cut

__PACKAGE__->table("bioquestions");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'bioquestions_id_seq'

=head2 question

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
    sequence          => "bioquestions_id_seq",
  },
  "question",
  { data_type => "varchar", is_nullable => 1, size => 40 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 bioanswers

Type: has_many

Related object: L<DB::Schema::Result::Bioanswer>

=cut

__PACKAGE__->has_many(
  "bioanswers",
  "DB::Schema::Result::Bioanswer",
  { "foreign.qid" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2014-01-19 14:02:19
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:C8c0dqRKOc3/ohQnYLhy9w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
