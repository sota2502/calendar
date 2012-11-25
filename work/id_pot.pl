#!/usr/bin/perl
package MySchema;
use strict;
use warnings;

use parent qw/DBIx::Class::Schema::Loader/;


1;
package main;

use strict;
use warnings;
use DBIx::Class::Schema::Loader;

my $schema = DBIx::Class::Schema::Loader->connect(
    'dbi:mysql:sota', 'root', '',
    {
        on_connect_do => 'SET NAMES utf8',
        AutoCommit => 1,
    },
);

my $resultset = $schema->resultset('IdPot');
$resultset->search->update({
    id => \'LAST_INSERT_ID(id + 1)',
});
print $schema->storage->last_insert_id;


__END__
printf "id: %d\n", $row->id;
$row->id(0);
$row->update();
printf "id: %d\n", $row->id;

$row->update({
    id => ['id + 1'],
});
printf "id: %d\n", $row->id;

__END__

use FindBin::libs;
use Calendar::Schema;

my $schema = Calendar::Schema->connect(
    'dbi:mysql:calendar',
    'root',
    '',
    {
        on_connect_do => 'SET NAMES utf8',
        AutoCommit => 1,
    },
);

my $rs = $schema->resultset('EventIdPot');
my ($row) = $rs->search();
$row->update({event_id => 'event_id + 1'});
