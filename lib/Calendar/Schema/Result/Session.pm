use utf8;
package Calendar::Schema::Result::Session;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Calendar::Schema::Result::Session

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<session>

=cut

__PACKAGE__->table("session");

=head1 ACCESSORS

=head2 session_id

  data_type: 'varchar'
  is_nullable: 0
  size: 40

=head2 data_json

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "session_id",
  { data_type => "varchar", is_nullable => 0, size => 40 },
  "data_json",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</session_id>

=back

=cut

__PACKAGE__->set_primary_key("session_id");


# Created by DBIx::Class::Schema::Loader v0.07024 @ 2012-11-30 23:49:09
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BRRRuDQHERvBQVIMo0/wIQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
