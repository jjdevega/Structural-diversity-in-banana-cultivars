#!/usr/bin/perl -w
use strict;
# janet.higgins@earlham.ac.uk 17.12.2018
# program to get stats from flagstat stats.txt file after alignment using bwa 
# input list of samples 

my @list =`ls stats*txt`;

#Check arguments
unless (@ARGV == 1 ) {
  print "Usage: get_read_count_align.pl <out_alignment_stats.txt> \n";
  exit;
}


#Open FHs
open(OUT, ">$ARGV[0]") or die "Couldn't open output file ($!)\n";


print OUT "sample\ttotal_reads\treads_mapped\tmapped\treads\tproperly_paired\tsingleton\n";
while (<@list>) {
    my $sam = $_;
	chomp $sam;
	print "$sam\n";
	#my @sam = split /\t/,$l;
	
	#my $file = "bowtie2_$sam.log";
	
	my $file = "$sam";
	#print "$file\n";
	if (-e $file) {
    	print "$file exists\n";
    	print OUT "$sam\t";
		open (FILE, $file) or die "Can't open file $file\n";
		while (<FILE>) {
		    #if ($_ =~/(\d+) \+ 0 in total \(QC-passed reads + QC-failed reads\)/) {
		    if ($_ =~/(\d+)\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\)/) {
		   print"matched\n";
		    print"$1\t";
	   			print OUT "$1\t";
	   			#print OUT "$2\t";
	  	 	}
	   		if ($_ =~/(\d+) \+ 0 mapped \((\d+.\d+%) : \S+/) {
	   			print OUT "$1\t";
	   			print OUT "$2\t";
	  	 	}
	  	 	if ($_ =~/(\d+) \+ 0 read1/) {
	  	 		print OUT "$1\t";
	  	 	}  
	  	 	if ($_ =~/(\d+) \+ 0 properly paired \((\d+.\d+%) : \S+/)  {
	  	 		print OUT "$1\t";
	  	 		print OUT "$2\t";
	  	 	}  
	  	 
	  	 	if ($_ =~/(\d+) \+ 0 singletons \(\d+.\d+% : \S+/)  {
	  	 		print OUT "$1\t";
	  	 	}  
	  	 	
		}	
	print OUT"\n";
	}
	else {
    	print "the file does not exist!\n";
	}
}
