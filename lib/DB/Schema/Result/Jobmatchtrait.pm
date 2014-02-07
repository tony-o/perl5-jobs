use utf8;
package DB::Schema::Result::Jobmatchtrait;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::Jobmatchtrait

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<jobmatchtraits>

=cut

__PACKAGE__->table("jobmatchtraits");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'jobmatchtraits_id_seq'

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 40

=head2 flags

  data_type: 'varchar'
  is_nullable: 1
  size: 20

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "jobmatchtraits_id_seq",
  },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 40 },
  "flags",
  { data_type => "varchar", is_nullable => 1, size => 20 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 job_reqs

Type: has_many

Related object: L<DB::Schema::Result::JobReq>

=cut

__PACKAGE__->has_many(
  "job_reqs",
  "DB::Schema::Result::JobReq",
  { "foreign.jmtid" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 trait_results

Type: has_many

Related object: L<DB::Schema::Result::TraitResult>

=cut

__PACKAGE__->has_many(
  "trait_results",
  "DB::Schema::Result::TraitResult",
  { "foreign.jmtid" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2014-02-06 13:56:37
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1HDXN7lYftusbm76ktU/NQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
