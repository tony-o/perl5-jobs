use utf8;
package DB::Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::User

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<users>

=cut

__PACKAGE__->table("users");

=head1 ACCESSORS

=head2 uid

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'users_uid_seq'

=head2 domain

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 username

  data_type: 'varchar'
  is_nullable: 1
  size: 128

=head2 pass

  data_type: 'varchar'
  is_nullable: 1
  size: 130

=head2 usertype

  data_type: 'varchar'
  default_value: 'JS'
  is_nullable: 1
  size: 2

=head2 datecreated

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 1
  original: {default_value => \"now()"}

=head2 oauth

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "uid",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "users_uid_seq",
  },
  "domain",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "username",
  { data_type => "varchar", is_nullable => 1, size => 128 },
  "pass",
  { data_type => "varchar", is_nullable => 1, size => 130 },
  "usertype",
  { data_type => "varchar", default_value => "JS", is_nullable => 1, size => 2 },
  "datecreated",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 1,
    original      => { default_value => \"now()" },
  },
  "oauth",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</uid>

=back

=cut

__PACKAGE__->set_primary_key("uid");

=head1 UNIQUE CONSTRAINTS

=head2 C<p_users_username>

=over 4

=item * L</username>

=back

=cut

__PACKAGE__->add_unique_constraint("p_users_username", ["username"]);

=head1 RELATIONS

=head2 aroles

Type: has_many

Related object: L<DB::Schema::Result::Arole>

=cut

__PACKAGE__->has_many(
  "aroles",
  "DB::Schema::Result::Arole",
  { "foreign.uid" => "self.uid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 bioanswers

Type: has_many

Related object: L<DB::Schema::Result::Bioanswer>

=cut

__PACKAGE__->has_many(
  "bioanswers",
  "DB::Schema::Result::Bioanswer",
  { "foreign.uid" => "self.uid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 educations

Type: has_many

Related object: L<DB::Schema::Result::Education>

=cut

__PACKAGE__->has_many(
  "educations",
  "DB::Schema::Result::Education",
  { "foreign.uid" => "self.uid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 employers

Type: has_many

Related object: L<DB::Schema::Result::Employer>

=cut

__PACKAGE__->has_many(
  "employers",
  "DB::Schema::Result::Employer",
  { "foreign.uid" => "self.uid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 jobmatches

Type: has_many

Related object: L<DB::Schema::Result::Jobmatch>

=cut

__PACKAGE__->has_many(
  "jobmatches",
  "DB::Schema::Result::Jobmatch",
  { "foreign.uid" => "self.uid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 personalitytraits

Type: has_many

Related object: L<DB::Schema::Result::Personalitytrait>

=cut

__PACKAGE__->has_many(
  "personalitytraits",
  "DB::Schema::Result::Personalitytrait",
  { "foreign.uid" => "self.uid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 profile

Type: might_have

Related object: L<DB::Schema::Result::Profile>

=cut

__PACKAGE__->might_have(
  "profile",
  "DB::Schema::Result::Profile",
  { "foreign.uid" => "self.uid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 skillsusers

Type: has_many

Related object: L<DB::Schema::Result::Skillsuser>

=cut

__PACKAGE__->has_many(
  "skillsusers",
  "DB::Schema::Result::Skillsuser",
  { "foreign.uid" => "self.uid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 trait_results

Type: has_many

Related object: L<DB::Schema::Result::TraitResult>

=cut

__PACKAGE__->has_many(
  "trait_results",
  "DB::Schema::Result::TraitResult",
  { "foreign.uid" => "self.uid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 videorequests

Type: has_many

Related object: L<DB::Schema::Result::Videorequest>

=cut

__PACKAGE__->has_many(
  "videorequests",
  "DB::Schema::Result::Videorequest",
  { "foreign.uid" => "self.uid" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-03-20 10:30:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:e/Hnl5tT2QPILMNzLfwVkg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
