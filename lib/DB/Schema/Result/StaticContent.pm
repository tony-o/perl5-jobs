use utf8;
package DB::Schema::Result::StaticContent;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

DB::Schema::Result::StaticContent

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<static_content>

=cut

__PACKAGE__->table("static_content");

=head1 ACCESSORS

=head2 spath

  data_type: 'varchar'
  is_nullable: 0
  size: 40

=head2 scontent

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "spath",
  { data_type => "varchar", is_nullable => 0, size => 40 },
  "scontent",
  { data_type => "text", is_nullable => 1 },
);

=head1 UNIQUE CONSTRAINTS

=head2 C<static_content_spath_key>

=over 4

=item * L</spath>

=back

=cut

__PACKAGE__->add_unique_constraint("static_content_spath_key", ["spath"]);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-03-16 16:13:05
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:66TVYPB+kNOKz5vD5v/kVA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
