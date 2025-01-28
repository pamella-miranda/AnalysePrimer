#!/usr/bin/perl

#---------------------------------------------------------------------
#   Last modified: 13 january 2025
#
#   Calculation of melting tempeurature of primers
#
#   primer --> code for the primer set without the extension ".fasta"
#
#   perl calculate_primer_tm.pl primer
#
#---------------------------------------------------------------------

use strict;

my $tfreg = "/usr/bin/tfreg"; #TfReg software
my $canreg = "/usr/share/TfReg/data/dna_pb_60.reg"; #dna regression data
my $canpar = "/usr/share/TfReg/data/dna_pb_60.par"; #dna parameters

#primer set file
my $pr_file = $ARGV[0];

#opening  of primer ser file
open(PR,"$pr_file.fasta") or die("Could not open $pr_file.fasta");

#creating the result file with the melting temperature
my $canfile = "$pr_file-tm.dat";

open(OUT,">$canfile");
print OUT "temperature #$pr_file\n";

#creating the basic file to use in TfReg
#capturing the primer ids
my $id='';
while (my $line=<PR>)
  {
  if ($line =~ />([^\s]+)\s/)
    {
    $id=$1;
    }
  else
    {
    chomp($line);

    #generating primer complementary sequence
    my $comp=$line;
    $comp =~ tr/ACGT/TGCA/;
    #each line of the basic file for TfReg
    print OUT "$line $comp 60.0 50 0.5 #$id\n";
    $id='';
    }    
  }
close(OUT);

#running the TfReg software to calculate the melting temperatures
system("$tfreg -m=pb -pbc=0 -t=370 -cutoff=10 -int=-1:200/400 -res=prediction -reg=$canreg -par=$canpar -data=$canfile -o=$pr_file-tm-primer -pm=-1 -mar=2 &> $pr_file-tm-primer.echo\n");

