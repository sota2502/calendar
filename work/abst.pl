#!/usr/bin/perl 
use strict;
use warnings;

use SQL::Abstract;

my $sqla = SQL::Abstract->new();
my ($sql, @binds) = $sqla->update(
    'id_pot',
    {
        event_id => \[ 'LAST_INSERT_ID(event_id + ?)', 1 ],
    },
);
print $sql, "\n";
print join ',', @binds;
print "\n";

($sql, @binds) = $sqla->update(
    'id_pot',
    {
        event_id => [ 'event_id + 1' ],
    },
);
print $sql, "\n";
print join ',', @binds;
print "\n";
