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
);


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2013-12-17 12:58:22
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:tAUReSSN5g0bmFFnkvqhpQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
