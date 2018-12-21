#!/usr/bin/perl -w

open F, "<", $ARGV[0] or die "fail to open file";

foreach $line  (<F>){
# preprocessing line
    if ($line =~ /#!/){
        print "#!/usr/bin/perl -w\n";
    }

#comments 
    elsif ($line =~ /# /){
        print $line;
    }

# echo line
    elsif ($line =~ /echo/){
        chomp $line;
        $line =~ s/echo /print "/;
        print "$line\\n\";\n";
    }

# while statement
    elsif ($line =~ /while/){
        chomp $line;
        $line =~ s/\(\(/( /;
        $line =~ s/\)\)/) /;
        if ($line =~ /(\s+)while/){
            print $1;
        }
        
        my @arr = split ' ', $line;
        foreach my $word (@arr){
            if ($word =~ /while/){
                print "$word";
            }
            
            elsif ($word =~ /[a-zA-Z]/){
                print "\$$word";
            }
            else {
                print "$word";
            }
        }
        print "{\n";
    }

# if statement
    elsif ($line =~ /if/){
        chomp $line;
        $line =~ s/\(\(/( /;
        $line =~ s/\)\)/) /;
        if ($line =~ /(\s+)if/){
            print $1;
        }
        
        my @arr = split ' ', $line;
        foreach my $word (@arr){
            if ($word =~ /if/){
                print "$word";
            }
            
            elsif ($word =~ /[a-zA-Z]/){
                print "\$$word";
            }
            else {
                print "$word";
            }
        }
        print "{\n";
    }

# assignment
    elsif ($line =~ /=/){
        $line =~ s/\(\(/  /;
        $line =~ s/\)\)/  /;
        $line =~ s/\$/ /g;
        if ($line =~ /(\s+)[a-zA-Z]/){
            print $1;
        }
        
        my @arr = split ' ', $line;
        foreach my $word (@arr){
            if ($word =~ /[a-zA-Z]+/){
                print "\$$word";
            }
            else {
                print $word;
            }
        }
        print ";\n";
    }

# else 
    elsif ($line =~ /else$/){
        chomp $line;
        $line =~ /(\s+)/; 
        print "$1}\n";
        print "$line {\n";
    }

# fi
    elsif ($line =~ /fi$/){
        $line =~ s/fi/}/;
        print $line;
    }

# done 
    elsif ($line =~ /done$/){
        $line =~ s/done/}/;
        print $line;
    }

# then
    elsif ($line =~ /then$/){
        next;
    }
    
# do
    elsif ($line =~ /do$/){
        next;
    }
    
# else
    else {
        print "$line";
    }
}

close F;
