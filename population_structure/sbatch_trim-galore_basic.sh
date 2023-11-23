#!/bin/bash -e
#SBATCH -p ei-medium
#SBATCH -J trim
#SBATCH -N 1 # number of nodes
#SBATCH -c 1 # number of tasks
#SBATCH --mem 50G # memory pool for all cores


source trim_galore-0.5.0


for i in *_R1.fastq.gz; 

do 

trim_galore --quality 20 --length 80 --fastqc --paired ${i} ${i/_R1.fastq.gz}_R2.fastq.gz -o basic

done;

