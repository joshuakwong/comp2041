#!/usr/bin/perl

use warnings;
use strict;

my $snap = $ARGV[0];
our %dict;

while (my $input = <STDIN>){
    chomp $input;
    $dict{$input}++;
    if ($dict{$input} == $snap) {
        print "Snap: $input\n";
        exit;
    }
}
