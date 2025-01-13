#!/bin/bash

# ---------------------------------------------------------------------
#   Last modified: 13 january 2025
#
#   Alignment of genomes and primers/probes
#
#   genomes --> folder with the genome files
#   ids --> file with the genome ids, e.g. id-genomes.dat
#   primer --> code for the primer set without the extension ".fasta"
#
#   ./align_primer.sh genomes ids primer
#
# ---------------------------------------------------------------------

#the genome files
for G in $1; do

#the genome ids file
for I in $(cat $2); do

#the primer set file
for P in $3 ; do

#the genome/primer alignments
/usr/bin/align_primer -g=${G}/${I}.fasta -p=${P}.fasta -o=${I}-${P} -tf=${I}-${P}-tfreg.dat &> ${I}-${P}.echo

done

done

done
