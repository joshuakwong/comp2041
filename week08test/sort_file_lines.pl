#!/usr/bin/perl

use warnings;
use strict;


open F, "<", $ARGV[0], or die "fail to open file";
my %dict;

while (my $line = <F>){
    chomp $line;
    $dict{$line}=length($line)+0;
}

foreach my $key (sort {$dict{$a} <=> $dict{$b} or $a cmp $b} keys %dict){
    print "$key\n";
}


#foreach my $key (sort {$a <=> $b} values %dict){
#    print "$key\n";
#}
