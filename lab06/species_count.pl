#!/usr/bin/perl -w

if (@ARGV != 2){
    print "usage: ./species_count.pl <whale species> <filename>";
    exit 1;
}

$species = $ARGV[0];
$pod = 0;
$count = 0;

open F, "<", $ARGV[1] or die "file cannot be opened";
while ($line = <F>){
    if ($line =~ /$species/){
        $pod++;
        $line =~ /^\d{2}\/\d{2}\/\d{2}\s+(\d+)\s+(.*)$/;
        $count += $1; 
    }
} 

print "$species observations: $pod pods, $count individuals\n";
