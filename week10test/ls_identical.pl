#!/usr/bin/perl

use warnings;
use strict;

my @arr = glob("$ARGV[0]/*");

use File::Compare;
foreach my $item (@arr){
    $item =~ s/.*\///;
    if (compare("$ARGV[0]/$item", "$ARGV[1]/$item") == 0){
        print "$item\n";
    }
}
