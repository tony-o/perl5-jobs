use utf8;
package DB::Schema::Result::Employer;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::Employer

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<employers>

=cut

__PACKAGE__->table("employers");

=head1 ACCESSORS

=head2 eid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'employers_eid_seq'

=head2 uid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 employer

  data_type: 'varchar'
  is_nullable: 1
  size: 80

=head2 jobtitle

  data_type: 'varchar'
  is_nullable: 1
  size: 80

=head2 city

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 state

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 jobclass

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 startdt

  data_type: 'date'
  is_nullable: 1

=head2 enddt

  data_type: 'date'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "eid",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "employers_eid_seq",
  },
  "uid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "employer",
  { data_type => "varchar", is_nullable => 1, size => 80 },
  "jobtitle",
  { data_type => "varchar", is_nullable => 1, size => 80 },
  "city",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "state",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "jobclass",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "startdt",
  { data_type => "date", is_nullable => 1 },
  "enddt",
  { data_type => "date", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</eid>

=back

=cut

__PACKAGE__->set_primary_key("eid");

=head1 RELATIONS

=head2 jobclass

Type: belongs_to

Related object: L<DB::Schema::Result::Jobclass>

=cut

__PACKAGE__->belongs_to(
  "jobclass",
  "DB::Schema::Result::Jobclass",
  { jid => "jobclass" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 state

Type: belongs_to

Related object: L<DB::Schema::Result::State>

=cut

__PACKAGE__->belongs_to(
  "state",
  "DB::Schema::Result::State",
  { id => "state" },
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


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2013-12-18 17:00:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Y04NUoSCntnQ0tJYMgE5LQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
