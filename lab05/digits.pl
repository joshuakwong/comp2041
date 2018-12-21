#!/usr/bin/perl -w

while (<STDIN>){
    $_ =~ s/[01234]/</g;
    $_ =~ s/[6789]/>/g;
    print "$_";
}
