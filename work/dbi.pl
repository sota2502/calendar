#!/usr/bin/perl 
use strict;
use warnings;

use FindBin::libs;
use DBI;

my $dbh = DBI->connect('dbi:mysql:sota', 'root', '', { RaiseError => 1 });

my $sth = $dbh->prepare(q{UPDATE id_pot SET id = LAST_INSERT_ID(id + 1)});
$sth->execute;

print $dbh->{mysql_insertid};
