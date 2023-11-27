#!/bin/bash

for file in *mdup.bam; 

do

echo "running bedgraph $file"

sbatch --wrap "source bedtools-2.24.0;genomeCoverageBed -bg -split -ibam ${file} -g Musa_acuminata_pahang_v4.window.bed > ${file}.bedgraph" -c 1 -N 1 -e error.log -o out.log -p ei-medium --mem=20G -J bedtools


done





