#!/bin/bash

for file in *bam.bedgraph; 

do

echo "running coverage $file"

sbatch --wrap "source bedtools-2.24.0;bedtools map -a ../AABB_window100kb.bed -b  ${file} -c 4 -o median > ${file}_median_cov.txt" -c 1 -N 1 -e error.log -o out.log -p ei-short --mem=50G -J bedtools

done





