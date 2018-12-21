#!/usr/bin/perl -w

open F, "<", $ARGV[0] or die "fail to open file";

my %pod;
my %count;

my %data;
while ($line = <F>){
    if ($line =~ /^\d{2}\/\d{2}\/\d{2}\s+(\d+)\s+(.*)$/){
        $name = lc ($2);
        $count = $1;
        $name =~ s/\s+/ /g;
        $name =~ s/s$//;
        $name =~ s/ $//;
        $pod{$name}++;
        $count{$name} += $count;
    }
}

for my $species (sort keys %pod){
    print "$species observations: $pod{$species} pods, $count{$species} individuals\n";
}
