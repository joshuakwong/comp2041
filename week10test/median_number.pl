#!/usr/bin/perl

use warnings;
use strict;

use POSIX;
my @arr = sort { $a <=> $b } @ARGV;
my $item = $#arr;
my $var = ceil($item/2);
print "$arr[$var]\n";

