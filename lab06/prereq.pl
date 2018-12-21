#!/usr/bin/perl -w

$pgurl = "http://www.handbook.unsw.edu.au/postgraduate/courses/2018/$ARGV[0].html";
$ugurl = "http://www.handbook.unsw.edu.au/undergraduate/courses/2018/$ARGV[0].html";
open F, "wget -q -O- $ugurl|" or die;
while ($line = <F>) {
    if ($line =~ /Prerequisite/ ){
        $line =~ s/Excluded:.*//g;
        @courses = $line =~ /([A-Z]{4}\d{4})/g;
        print join ("\n", @courses);
        print "\n";
    }
}

close F;

open F, "wget -q -O- $pgurl|" or die;
while ($line = <F>) {
    if ($line =~ /Prerequisite/ ){
        $line =~ s/Excluded:.*//g;
        @courses = $line =~ /([A-Z]{4}\d{4})/g;
        print join ("\n", @courses);
        print "\n";
    }
}

close F;

