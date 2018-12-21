#!/usr/bin/perl

use warnings;
use strict;

my $i=0;
while (my $line = <>){
    chomp $line;
    $line = lc $line;
    my @arr = $line =~ /([a-zA-Z]+)/g;
    
    for my $word (@arr) {
        $i++;
    }
}
print "$i words\n";


