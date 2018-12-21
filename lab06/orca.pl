#!/usr/bin/perl -w


open F, "<", $ARGV[0] or die "fail to open file";

my $count=0;

while (my $line = <F>){
    #print $line;
    if ($line =~ /Orca/){
        $line =~ /^\d{2}\/\d{2}\/\d{2}\s+(\d+)\s+(.*)$/;
        $count += $1;
    }
}

print "$count Orcas reported in $ARGV[0] \n";
