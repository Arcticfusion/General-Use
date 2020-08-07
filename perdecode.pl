#!/usr/bin/perl

my $filename = 'percent_dict';
open (my $fh, $filename)
	or die "Could not open file '$filename' $!";

my %dict;

# Extract Percent Encoded Dictionary in Reverse
while (my $line = <$fh>) {
	chomp $line;
	if ($line =~ /(.)\s+(\S+)/) {
		$dict{$2} = $1;
	} else {
		die "error: regex failed";
	}

}

# Read from STDIN
while (my $input = <STDIN>){
	chomp $input;
	my @matches = ( $input =~ /(%[2-7][0-9A-F]|%[Ee]2%8[02]%[AB9][0-9A-F]|%(?:C[0-9A-F]%[89AB][0-9A-F]|E2%8[04]))/ig );
	if (@matches) {
		foreach (@matches) {
			$_ = uc($_);
			if (exists $dict{$_}) {
				$input =~ s/$_/$dict{$_}/ig;
			} 
		}
	}
	
	print "$input\n";

}
