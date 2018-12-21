#!/usr/bin/perl 

use warnings;
use strict;

open (my $f, "<", "$ARGV[0]") or die ("fail to open file");

my $sum = 0;
foreach my $line (<$f>){
    if ($line =~ /\{.*\$([0-9]*\.[0-9]*)/){
        $sum += $1;
    }
}

printf("\$%.2f\n", $sum);
