#!/usr/bin/perl -w


$i=$ARGV[0];
open F, '>', $ARGV[2] or die "fail to create file";

while ($i <= $ARGV[1]) {
    print F "$i\n";
    $i++;
}
