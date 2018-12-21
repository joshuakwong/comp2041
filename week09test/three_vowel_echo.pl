#!/usr/bin/perl 

use warnings;
use strict;

my @words = @ARGV;
my @toPrint;
foreach my $word (@words){
    if ($word =~ /[aeiouAEIOU]{3}/){
        push (@toPrint, $word);
    }  
}

for (my $i=0; $i<$#toPrint+1; $i++){
    print "$toPrint[$i]";
    print " " if ($i < $#toPrint);
}
print "\n";
