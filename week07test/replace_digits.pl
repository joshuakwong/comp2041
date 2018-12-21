#!/usr/bin/perl

use warnings;

my $count=0;
our @arr;
open F, "<", $ARGV[0] or die "fail to open file";
while ($line = <F>){
    chomp $line;
    $line =~ s/[0-9]/#/g;
    $arr{$count} = $line;
    $count++;
}
close F;
open FI, ">", $ARGV[0] or die "fail to open file";
$i=0;
while ($i < $count){
    print FI "$arr{$i}\n";
    $i++
}
