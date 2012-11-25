use utf8;
package Calendar::Schema::Result::AttendMember;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Calendar::Schema::Result::AttendMember

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

=head1 TABLE: C<attend_member>

=cut

__PACKAGE__->table("attend_member");

=head1 ACCESSORS

=head2 event_id

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 member_id

  data_type: 'varchar'
  is_nullable: 0
  size: 20

=head2 number

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 created_datetime

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "event_id",
  { data_type => "bigint", extra => { unsigned => 1 }, is_nullable => 0 },
  "member_id",
  { data_type => "varchar", is_nullable => 0, size => 20 },
  "number",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
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

=item * L</member_id>

=back

=cut

__PACKAGE__->set_primary_key("event_id", "member_id");


# Created by DBIx::Class::Schema::Loader v0.07024 @ 2012-11-23 03:22:08
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:rOFfJXUn1ug2GPojtsG3uQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
