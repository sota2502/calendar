#!/usr/bin/perl 
use strict;
use warnings;

use FindBin::libs;
use Calendar::Entity::Event;
use Data::Dumper;

my $event = Calendar::Entity::Event->create(
    page_id => 1,
    module_id => 1,
    title => 'hoge',
    description => 'hoge hoge hoge',
    scheduled_datetime => '2012-12-04 01:00:00',
);

my $lookuped = Calendar::Entity::Event->lookup($event->event_id);
warn Dumper $lookuped;
