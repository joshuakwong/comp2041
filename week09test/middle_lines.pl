#!/usr/bin/perl

use warnings;
use strict;

open my $f, "<", $ARGV[0] or die "fail to open file";
my @arr = <$f>;
exit 1 if (!@arr);
if ($#arr%2 == 0){
    print "$arr[$#arr/2]";
}
else {
    print "$arr[$#arr/2]";
    print "$arr[$#arr/2+1]";
}
close $f;
