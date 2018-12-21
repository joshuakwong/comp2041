#!/usr/bin/perl

use warnings;
use strict;
use List::Util qw(max);

my @strings;
my @values;
my $maxV = -1000000000000000;
while (my $line = <>){
    my @buf = $line =~ /(-?[0-9]*\.?[0-9]+)+/g;
    $maxV = max(@buf) if (@buf && max(@buf) > $maxV);
    push (@strings, $line);
}

foreach my $line (@strings){
    print $line if ($line =~ /$maxV/);
}
