#!/usr/bin/perl 
use strict;
use warnings;

use Data::Dumper;
use Calendar::Model::Calendar;

my $ret = Calendar::Model::Calendar->config;
warn Dumper $ret;
