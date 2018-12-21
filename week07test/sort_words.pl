#!/usr/bin/perl

use warnings;

while ($line = <STDIN>){
    my @words = $line =~ /(\S+)/g;
    our @sorted = sort @words;
    print join(" ", @sorted), "\n";
}

