#!/usr/bin/perl -w


$num_lines = 10;

if ((@ARGV > 0) && ($ARGV[0] =~ /-[0-9]+/)) {
	$num_lines = $ARGV[0];
	$num_lines = -($num_lines);
	shift @ARGV;
}
# print @ARGV+0;

if (@ARGV > 0){
	foreach $file (@ARGV){
		open F, '<', $file or die "$0: Can't open $file: $!\n";
		if (@ARGV > 1){
			print "==> $file <==\n";
		}

		@line = <F>;
		$line_count = `wc -l < $file`;

		$to_print = $num_lines;
		$to_print = $line_count if ($line_count < $num_lines);
		$to_print = (-$to_print);
		print @line[$to_print..-1];

		close F;
	}
}

else {
	@line = <>;
	$to_print = $num_lines;
	$to_print = (scalar @line) if ((scalar @line) < $num_lines);
	$to_print = (-$to_print);

	print @line[$to_print..-1];

}


