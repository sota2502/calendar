package Calendar::Utils::Array;
use strict;
use warnings;

use Params::Validate qw/validate SCALAR ARRAYREF/;
use Date::Calc qw/Day_of_Week Days_in_Month/;

my ($W_MON, $W_TUE, $W_WED, $W_THU, $W_FRI, $W_SAT, $W_SUN) = (1 .. 7);
my @DOWS = ($W_SUN, $W_MON, $W_TUE, $W_WED, $W_THU, $W_FRI, $W_SAT);
my %DOW_NAME = (
    1 => 'MON', 2 => 'TUE', 3 => 'WED', 4 => 'THU',
    5 => 'FRI', 6 => 'SAT', 7 => 'SUN',
);

sub calendar_table {
    my %args = validate(@_, {
        year   => { type => SCALAR, regex => qr/\A\d+\z/ },
        month  => { type => SCALAR, regex => qr/\A\d+\z/ },
        events => { type => ARRAYREF },
    });

    my ($year, $month, $events) = @args{qw/year month events/};

    my $end_day   = Days_in_Month($year, $month);
    my $start_dow = Day_of_Week($year, $month, 1);
    my $end_dow   = Day_of_Week($year, $month, $end_day);

    my $dow = $start_dow;
    my @weeks;
    my $week;
    my $map_event = __map_date($events);
    foreach my $day ( 1 .. $end_day ) {
        if ( !$week || $dow == $W_SUN ) {
            $week = {};
            push @weeks, $week;
        }

        my $day_events = $map_event->{$day} || [];
        $week->{$dow} = {
            day    => $day,
            events => $day_events,
        };

        if ( ++$dow > $W_SUN ) {
            $dow = $W_MON;
        }    
    }

    my $dummy = {
        day    => undef,
        events => [],
    };
    my @table = map {
        my $week = $_;
        my @days = map {
            my $dow = $_;
            my $col = $week->{$dow} || $dummy;
            +{
                dow      => $dow,
                dow_name => $DOW_NAME{$dow},
                day      => $col->{day},
                events   => $col->{events},
                count    => scalar @{ $col->{events} || [] },
            }
        } (@DOWS);
        \@days;
    } @weeks;

    return \@table;
}

sub __map_date {
    my $events = shift;

    my %map;
    foreach my $event (@$events) {
        my $day = $event->scheduled_datetime->day;
        $map{$day} ||= [];
        push @{ $map{$day} }, $event;
    }

    return \%map;
}


1;
