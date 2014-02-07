use utf8;
package DB::Schema::Result::JobReqsPrecanned;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::JobReqsPrecanned

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<job_reqs_precanned>

=cut

__PACKAGE__->table("job_reqs_precanned");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'job_reqs_precanned_id_seq'

=head2 jmtid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 jid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 value

  data_type: 'double precision'
  is_nullable: 1

=head2 version

  data_type: 'integer'
  default_value: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "job_reqs_precanned_id_seq",
  },
  "jmtid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "jid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "value",
  { data_type => "double precision", is_nullable => 1 },
  "version",
  { data_type => "integer", default_value => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 jid

Type: belongs_to

Related object: L<DB::Schema::Result::Jobclass>

=cut

__PACKAGE__->belongs_to(
  "jid",
  "DB::Schema::Result::Jobclass",
  { jid => "jid" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 jmtid

Type: belongs_to

Related object: L<DB::Schema::Result::Jobmatchtrait>

=cut

__PACKAGE__->belongs_to(
  "jmtid",
  "DB::Schema::Result::Jobmatchtrait",
  { id => "jmtid" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2014-02-06 18:54:45
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:38Wl1wZx8aG/hhTKlBzchg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
