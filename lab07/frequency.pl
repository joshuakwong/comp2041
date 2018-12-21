#!/usr/bin/perl

use warnings;
use strict;

foreach my $file (glob "lyrics/*.txt") {
    if ($file =~ /lyrics\/([A-Za-z_]+)\.txt/) {
        my $artist = $1;
        $artist =~ s/_/ /g;

        my $appear = count ($file, $ARGV[0]);
        my $total = total ($file);
        my $dec = $appear/$total;
        #print "$appear     $total   $dec     $artist \n";
        printf("%4d/%6d = %.9f %s\n", $appear, $total, $dec, $artist);
    }

}

sub count {
    my @args = @_;
    my %hash;
    $hash{$args[1]} = 0;
    open F, '<', $args[0] or die "unable to open file: $args[0]";

    while (my $line = <F>){
        chomp $line;
        $line = lc $line;
        my @words = $line =~ /[a-zA-Z]+/g;
        
        for my $word (@words){
            $hash{$word}++;
        }
    }
    close F;  
    return $hash{$args[1]};

}


sub total {
    my @args = @_;
    open F, '<', $args[0] or die "unable to open file: $args[0]";
    
    my $i=0;
    while (my $line = <F>){
        chomp $line;
        $line = lc $line;
        my @arr = $line =~ /([a-zA-Z]+)/g;
        
        for my $word (@arr) {
            $i++;
        }
    }

    close F;
    return $i;

} 
