use utf8;
package DB::Schema::Result::Bioanswer;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::Bioanswer

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<bioanswers>

=cut

__PACKAGE__->table("bioanswers");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'bioanswers_id_seq'

=head2 uid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 qid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 val

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "bioanswers_id_seq",
  },
  "uid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "qid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "val",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 qid

Type: belongs_to

Related object: L<DB::Schema::Result::Bioquestion>

=cut

__PACKAGE__->belongs_to(
  "qid",
  "DB::Schema::Result::Bioquestion",
  { id => "qid" },
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


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2014-01-19 14:02:19
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:mDiTNl9aMIXUwtrXtOHYUw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
