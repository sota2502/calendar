use utf8;
package Calendar::Schema::Result::EventIdPot;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Calendar::Schema::Result::EventIdPot

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

=head1 TABLE: C<event_id_pot>

=cut

__PACKAGE__->table("event_id_pot");

=head1 ACCESSORS

=head2 event_id

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "event_id",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07024 @ 2012-11-23 03:22:08
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:iW2NluvrLwULU+5dQpxb5Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
