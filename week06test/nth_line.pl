#!/usr/bin/perl -w

open F, '<', $ARGV[1] or die "fail to open file";

@lines = <F>;
#print $ARGV[0]-1;
#print @lines+0;
if ($ARGV[0]-1 < @lines+0){
    print $lines[$ARGV[0]-1];
}
