#!/usr/bin/perl

use warnings;
use strict;


my $i=0;
my $filename=".$ARGV[0].$i";

while (-e $filename){
    $i++;
    $filename=".$ARGV[0].$i";
}

#print "$filename\n";
use File::Copy;
copy("$ARGV[0]", "$filename") or die "copy fail";
print "Backup of '$ARGV[0]' saved as '$filename'\n";
