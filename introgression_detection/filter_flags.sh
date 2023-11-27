#!/bin/bash
#SBATCH -p ei-medium
#SBATCH -N 1
#SBATCH -c 1 # number of tasks
#SBATCH --mem 150G # memory pool for all cores

myID=$1

source samtools-1.7

samtools view -h ${myID} | grep -v -e 'XA:Z:' -e 'SA:Z:' | samtools view -b > ${myID}_unique.bam
