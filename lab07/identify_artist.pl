#!/usr/bin/perl

use warnings;
#use strict;

#count the number of words for each artist
#get the freq of each word for each artist
foreach my $file (glob "lyrics/*.txt") {
     %freq;
     %count;
    my $artist = $file;
    $artist =~ s/.txt$//g;
    $artist =~ s/lyrics\///g;
    $artist =~ s/_/ /g;
    #print "$artist\n";
    
    open F, '<', $file or die "fail to open file: $file";
    
    while (my $line = <F>){
        $line = lc $line;
        my @words = $line =~ /[a-zA-Z]+/g;
        for my $word (@words){
            $count{$artist}++;
            $freq{$artist}{$word}++;
        }
    }
    #print "$count{$artist}\n";
    close F;
}

#list of artists
@artistList = keys %count;


for my $songFile (@ARGV){
    open F, '<', $songFile or die "fail to open file: $songFile";
    my %logProb;

    while (my $line = <F>){
        $line = lc $line;
        my @words = $line =~ /[a-zA-Z]+/g;
        for my $word (@words){
            #print "$word\n";
            for $artist (@artistList){
                if ( ! defined $freq{$artist}{$word}){
                    $logProb{$artist} += log (1/$count{$artist});
                }
                else {
                    $logProb{$artist} += log (($freq{$artist}{$word}+1)/$count{$artist});
                }
            }
        }
    }

    close F;

    @sorted = sort {$logProb{$b} <=> $logProb{$a}} keys %logProb;
    #for my $i (@sorted){
    #    print "$i\n";
    #}


    printf ("%s most resembles the work of %s (log-probability=%.1f)\n", $songFile, $sorted[0], $logProb{$sorted[0]});









}
