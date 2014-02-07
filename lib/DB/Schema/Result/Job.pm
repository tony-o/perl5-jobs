use utf8;
package DB::Schema::Result::Job;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::Job

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<jobs>

=cut

__PACKAGE__->table("jobs");

=head1 ACCESSORS

=head2 jid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'jobs_jid_seq'

=head2 domain

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 title

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 description

  data_type: 'text'
  is_nullable: 1

=head2 dateposted

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 1
  original: {default_value => \"now()"}

=head2 jobclass

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "jid",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "jobs_jid_seq",
  },
  "domain",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "title",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "description",
  { data_type => "text", is_nullable => 1 },
  "dateposted",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 1,
    original      => { default_value => \"now()" },
  },
  "jobclass",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</jid>

=back

=cut

__PACKAGE__->set_primary_key("jid");

=head1 RELATIONS

=head2 job_reqs

Type: has_many

Related object: L<DB::Schema::Result::JobReq>

=cut

__PACKAGE__->has_many(
  "job_reqs",
  "DB::Schema::Result::JobReq",
  { "foreign.jobid" => "self.jid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

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

=head2 jobmatches

Type: has_many

Related object: L<DB::Schema::Result::Jobmatch>

=cut

__PACKAGE__->has_many(
  "jobmatches",
  "DB::Schema::Result::Jobmatch",
  { "foreign.jid" => "self.jid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2014-02-06 18:54:45
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:vBYRHXWajKF0nKHo2ABVXw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
