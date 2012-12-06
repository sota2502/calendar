#!/usr/bin/perl 
use strict;
use warnings;

use Test::More;
use DateTime;
use Calendar::Entity::Event;
use Calendar::Utils::Array;

subtest 'empty' => sub {
    my $ret = Calendar::Utils::Array::calendar_table(
        year   => 2012,
        month  => 12,
        events => [],
    );

    isa_ok( $ret, 'ARRAY' );
};

subtest 'exists event' => sub {
    my $event = Calendar::Entity::Event->new({
        event_id            => 1,
        title               => 'hoge',
        scheduled_datetime  => DateTime->new(
            year  => 2012,
            month => 12,
            day   => 1,
        ),
    });

    my $ret = Calendar::Utils::Array::calendar_table(
        year   => 2012,
        month  => 12,
        events => [$event],
    );
use Data::Dumper; warn Dumper $ret;
    isa_ok( $ret, 'ARRAY' );
};


done_testing;
