#!/usr/bin/perl

use warnings;
use strict;

my %hash;
my $match;
$match = $ARGV[0];
$hash{$match} = 0;


while (my $line = <STDIN>){
    chomp $line;
    $line = lc $line;
    my @words = $line =~ /[a-zA-Z]+/g;
    
    for my $word (@words){
        $hash{$word}++;
    }
}

print "$match occurred $hash{$match} times\n";

