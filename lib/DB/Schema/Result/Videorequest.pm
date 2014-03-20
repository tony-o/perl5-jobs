use utf8;
package DB::Schema::Result::Videorequest;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::Videorequest

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<videorequests>

=cut

__PACKAGE__->table("videorequests");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'videorequests_id_seq'

=head2 uid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 jid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 rid

  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 vidpath

  data_type: 'varchar'
  is_nullable: 1
  size: 512

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "videorequests_id_seq",
  },
  "uid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "jid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "rid",
  { data_type => "varchar", is_nullable => 1, size => 64 },
  "vidpath",
  { data_type => "varchar", is_nullable => 1, size => 512 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<p_videorequests_uid_jid>

=over 4

=item * L</jid>

=item * L</uid>

=back

=cut

__PACKAGE__->add_unique_constraint("p_videorequests_uid_jid", ["jid", "uid"]);

=head1 RELATIONS

=head2 jid

Type: belongs_to

Related object: L<DB::Schema::Result::Job>

=cut

__PACKAGE__->belongs_to(
  "jid",
  "DB::Schema::Result::Job",
  { jid => "jid" },
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


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-03-20 15:20:07
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:drB94tkDqtNqtC5D3g4sRw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
