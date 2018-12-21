#!/usr/bin/perl

use warnings;

if (@ARGV < 2){
    print "Usage: ./identical_files.pl <files>\n";
    exit;
}

my @firstFile;
open(my $originFile, "<", $ARGV[0]) or die "fail to open $ARGV[0]\n";
my $count=0;
while (my $line = <$originFile>){
    $firstFile[$count] = $line;
    $count++;
}

my $fc=1;
while ($fc < @ARGV+0){
    my $lc=0;
    open(my $toCmp, "<", $ARGV[$fc]) or die "file $ARGV[$fc] does not exist\n";
    while (my $cmpLine = <$toCmp> ){
        if ( ! defined $firstFile[$lc] || $cmpLine ne $firstFile[$lc]){
            print "$ARGV[$fc] is not identical\n";
            exit;
        }
        $lc++;
    }
    $fc++;
}

print "All files are identical\n";

close $originFile;
