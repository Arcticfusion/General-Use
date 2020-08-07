#!/usr/bin/perl

my $filename = 'percent_dict';
open (my $fh, $filename)
	or die "Could not open file '$filename' $!";

my %dict;

while (my $line = <$fh>) {
	chomp $line;
	if ($line =~ /(.)\s+(\S+)/) {
		$dict{$1} = $2;
	} else {
		die "error: regex failed";
	}

}

while (my $input = <STDIN>){
	chomp $input;

	for my $c (split //, $input) {
		if (exists $dict{$c}) {
			print "$dict{$c}";
		} else {
			print "$c";
		}
	}

	print "\n";
}

