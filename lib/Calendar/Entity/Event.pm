package Calendar::Entity::Event;
use strict;
use warnings;

use base 'Calendar::Entity::Base';

use Params::Validate qw/validate SCALAR/;
use Date::Calc;

my @FIELDS = (qw(
    event_id
    page_id
    module_id
    title
    description
    details_json
    category
    attend_count
    attend_limit
    scheduled_datetime
    created_datetime
));

__PACKAGE__->mk_accessors(@FIELDS);

sub lookup {
    my $class = shift;

    my %args = validate(@_, {
        event_id => {
            type  => SCALAR,
            regex => qr/\A\d+\z/,
        },
    });

    my $schema = $class->schema('Calendar::Model::Calendar');
    my $row = $schema->resultset('Event')->find($args{event_id});

    return unless ( $row );

    my $fields = {
        map { +($_ => $row->$_) } @FIELDS
    };

    return $class->new($fields);
}

sub search {
    my $class = shift;
    my %args = validate(@_, {
        year  => { type => SCALAR, regex => qr/\A\d+\z/ },
        month => { type => SCALAR, regex => qr/\A\d+\z/ },
    });
    my ($year, $month) = @args{qw/year month/};

    my $days = Date::Calc::Days_in_Month($year, $month);
    my $start = sprintf "%04d-%02d-01 00:00:00", $year, $month;
    my $end   = sprintf "%04d-%02d-%02d 23:59:59", $year, $month, $days;


    my $schema = $class->schema('Calendar::Model::Calendar');
    my @rows = $schema->resultset('Event')->search({
        scheduled_datetime => { 'BETWEEN' => [$start, $end], },
    });

    my @list = map {
        my $row = $_;
        my $fields = {
            map { +($_ => $row->$_) } @FIELDS
        };
        $class->new($fields);
    } @rows;

    return \@list;
}

sub create {
    my ($class, %args) = @_;

    my $schema = $class->schema('Calendar::Model::Calendar');
    $schema->resultset('EventIdPot')->search->update({
        event_id => \'LAST_INSERT_ID(event_id + 1)',
    });

    my $event_id = $schema->storage->last_insert_id;
    unless ( $event_id ) {
        die 'Failed get event_id';
    }

    $args{event_id} = $event_id;
    $args{details_json} = '{}';
    $args{category} = '';
    $args{attend_count} = 0;
    $args{attend_limit} = 0;
    $args{created_datetime} ||= $class->now;

    my $row = $schema->resultset('Event')->create( \%args );
    return unless ( $row );

    return $class->new(\%args);
}

1;
