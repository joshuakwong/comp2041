#!/usr/bin/perl

use warnings;
use strict;

our $count=0;
our @dict;
foreach my $arg (@ARGV){
    next if (contains($arg) == 1);
    $dict[$count]=$arg;
    print "$arg ";
    $count++;
}
print "\n";


sub contains{
    my $i=0;
    while ($i < $count){
        #print "$dict[$i]--@_\n";
        return 1 if ("$dict[$i]" eq "@_");
        #print "no hit\n";
        $i++;
    }
    return 0;
}
