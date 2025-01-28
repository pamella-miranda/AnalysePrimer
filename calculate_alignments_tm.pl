#!/usr/bin/perl

# ---------------------------------------------------------------------
#   Last modified: 28 january 2025
#
#   Calculation of melting tempeurature of primer/genome alignments
#
#   id-genomes.dat --> file with genome ids
#   primer --> code for the primer set without the extension ".fasta"
#
#   perl calculate_primer_tm.pl id-genomes.dat primer
#
# ---------------------------------------------------------------------

use strict;
use warnings;
use List::Util qw(uniq);

my $tfreg = "/usr/bin/tfreg"; #TfReg software
my $canreg = "/usr/share/TfReg/data/dna_pb_60.reg"; #canonical dna regression data
my $canpar = "/usr/share/TfReg/data/dna_pb_60.par"; #canonical dna parameters
my $mmreg = "/usr/share/TfReg/data/dna_mm_cd_pb_60.reg"; #mismatched dna regression data
my $mmpar = "/usr/share/TfReg/data/dna_pb_60.par,/usr/share/TfReg/data/dna_mm_ci_pb_60.par,/usr/share/TfReg/data/dna_mm_cd_pb_60.par"; #mismatched dna parameters

#genome id file
my $id_list = $ARGV[0]

open (ID, '<', "$id_list") or die "Could not open";

#primer set file
my $p = $ARGV[1];

#creating the file for the melting temperature calculation
my $mmfile  = "$p-tm-mm.dat"; #mismatched alignments
my $canfile = "$p-tm-can.dat"; #canonical alignments

open (MM, ">$mmfile") or die "Could not open $mmfile";
print MM "temperature\n";
open (CAN, ">$canfile") or die "Could not open $canfile";
print CAN "temperature\n";

foreach my $id (<ID>){
    chomp $id;  
    
    my $id_primer = "$id-$p-tfreg.dat";
    
    open (FILE, '<', "$id_primer") or die "Could not open";
    my @lines = <FILE>;
    
    my @mmlines  = uniq(grep (/lcm=[123]\s/, @lines)); #mismatched lines

    foreach my $grep (@mmlines){
    
        if ($grep =~ /^[ACGT]+?\s[ACGT]+?\s/){
            my @mms;
            push (@mms, $grep);
            print MM join ('',@mms);
        }
    }

    my @canlines = uniq(grep (/lcm=0\s/, @lines)); #canonical lines
    print CAN join ('',@canlines);
    }

#running melting temperature calculation for canonical alignments
if (-e "$canfile")
  {
    system ("$tfreg -m=pb -pbc=0 -t=370 -cutoff=10 -int=-1:200/400 -res=sprediction -reg=$canreg -par=$canpar -data=$canfile -o=$p-res-can -pm=-1 -mar=2 &> $p-res-can.echo\n");
  }

#running melting temperature calculation for mismatched alignments
if (-e "$mmfile")
  {
  system ("$tfreg -m=pb -pbc=0 -t=370 -cutoff=10 -int=-1:200/400 -res=sprediction -reg=$mmreg -par=$mmpar -data=$mmfile -o=$p-res-mm -pm=-1 -mar=2 &> $p-res-mm.echo\n");
  }

close FILE;
close ID;
close MM;
close CAN;
