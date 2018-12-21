#!/usr/bin/perl -w

$num_arg = @ARGV +0;

if ($num_arg != 2){
    print "Usage: $0 <number of lines> <string>\n";
    exit 1;
}

$times = $ARGV[0];
$word = $ARGV[1];

if ($times !~ /^\d+/){
    print "$0: argument 1 must be a non-negative integer\n";
    exit 1;
}

$i=0;

while ($i < $times){
    print $word; 
    print "\n";
    $i++;
}
