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

=head2 weight

  data_type: 'integer'
  is_nullable: 1

=head2 coltype

  data_type: 'varchar'
  default_value: 'T'
  is_nullable: 1
  size: 1

=head2 linkedinmeta

  data_type: 'text'
  is_nullable: 1

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
  "weight",
  { data_type => "integer", is_nullable => 1 },
  "coltype",
  { data_type => "varchar", default_value => "T", is_nullable => 1, size => 1 },
  "linkedinmeta",
  { data_type => "text", is_nullable => 1 },
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


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-03-11 20:32:50
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8/AWYD2HvS2UT2clu7XqwQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
