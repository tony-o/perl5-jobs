use utf8;
package DB::Schema::Result::Personalityquestion;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::Personalityquestion

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<personalityquestions>

=cut

__PACKAGE__->table("personalityquestions");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'personalityquestions_id_seq'

=head2 question

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

=head2 flags

  data_type: 'varchar'
  is_nullable: 1
  size: 20

=head2 set

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "personalityquestions_id_seq",
  },
  "question",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "weight",
  { data_type => "integer", is_nullable => 1 },
  "testname",
  { data_type => "varchar", is_nullable => 1, size => 20 },
  "flags",
  { data_type => "varchar", is_nullable => 1, size => 20 },
  "set",
  { data_type => "integer", is_nullable => 1 },
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
  { "foreign.qid" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2014-01-17 12:43:29
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:F8V9Z+U9BFgzUj5rTJ2M0A


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
