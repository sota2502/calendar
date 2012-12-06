use strict;
use warnings;
use FindBin::libs;
use Calendar::Entity::Event;
use Calendar::Utils::Array;

my $events = Calendar::Entity::Event->search(
    year => 2012,
    month => 12,
);
my $cal = Calendar::Utils::Array::calendar_table(
    year   => 2012,
    month  => 12,
    events => $events,
);
use Data::Dumper;
warn Dumper $cal;
