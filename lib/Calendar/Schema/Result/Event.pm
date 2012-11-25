use utf8;
package Calendar::Schema::Result::Event;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Calendar::Schema::Result::Event

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

=head1 TABLE: C<event>

=cut

__PACKAGE__->table("event");

=head1 ACCESSORS

=head2 event_id

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 page_id

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 module_id

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 title

  data_type: 'varchar'
  is_nullable: 0
  size: 40

=head2 description

  data_type: 'text'
  is_nullable: 0

=head2 details_json

  data_type: 'text'
  is_nullable: 0

=head2 category

  data_type: 'varchar'
  is_nullable: 0
  size: 20

=head2 attend_count

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 attend_limit

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 scheduled_datetime

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 created_datetime

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "event_id",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 0 },
  "page_id",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 0 },
  "module_id",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 0 },
  "title",
  { data_type => "varchar", is_nullable => 0, size => 40 },
  "description",
  { data_type => "text", is_nullable => 0 },
  "details_json",
  { data_type => "text", is_nullable => 0 },
  "category",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "attend_count",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "attend_limit",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "scheduled_datetime",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "created_datetime",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</event_id>

=back

=cut

__PACKAGE__->set_primary_key("event_id");


# Created by DBIx::Class::Schema::Loader v0.07024 @ 2012-11-23 03:22:08
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:EQDG16Cp1/zTcVrZahqi+g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
