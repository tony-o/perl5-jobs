use utf8;
package DB::Schema::Result::Jobclass;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::Jobclass

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<jobclasses>

=cut

__PACKAGE__->table("jobclasses");

=head1 ACCESSORS

=head2 jid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'jobclasses_jid_seq'

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 60

=head2 isheader

  data_type: 'boolean'
  default_value: false
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "jid",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "jobclasses_jid_seq",
  },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 60 },
  "isheader",
  { data_type => "boolean", default_value => \"false", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</jid>

=back

=cut

__PACKAGE__->set_primary_key("jid");

=head1 RELATIONS

=head2 employers

Type: has_many

Related object: L<DB::Schema::Result::Employer>

=cut

__PACKAGE__->has_many(
  "employers",
  "DB::Schema::Result::Employer",
  { "foreign.jobclass" => "self.jid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2013-12-23 15:14:40
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1W/WyOZ31Xg2ezuFcXDRHA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
