#!/usr/bin/perl

use warnings;
use strict;

use File::Copy;

save() if ($ARGV[0] eq "save");

if ($ARGV[0] eq "load") {
    save();
    my $ssNum = $ARGV[1];
    print "Restoring snapshot $ssNum\n";
    foreach my $file (glob ".snapshot.$ssNum/*"){
        #$filename = $file =~ /\/(.+)/;
        copy ("$file", "./") or die "fail to copy";
        #print "$file\n";
    }
}


sub save{
    my $i=0;
    my $dirname=".snapshot.$i";
    while ( -d $dirname ){
        $i++;
        $dirname=".snapshot.$i";
    }
    mkdir $dirname;
    print "Creating snapshot $i\n";
    foreach my $file (glob "*"){
        next if ($file eq "snapshot.pl");
        copy ("$file", "$dirname/$file") or die "fail to copy";
    }
}
