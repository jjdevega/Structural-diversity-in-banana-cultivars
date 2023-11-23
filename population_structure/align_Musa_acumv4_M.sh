#!/bin/bash -e
#SBATCH -p ei-long
#SBATCH -N 1 # number of nodes
#SBATCH -c 1 # number of tasks
#SBATCH --mem 20G # memory pool for all cores

myID=$1

#DIR=/ei/projects/d/ddb748f8-e2d0-444c-a7f9-30680b49af25/scratch/higginsj/trimmed_reads
OUTDIR=/ei/projects/d/ddb748f8-e2d0-444c-a7f9-30680b49af25/scratch/higginsj/align_Musa_acuminate_v4
 
source bwa-0.7.17
source samtools-1.7

 
#bwa mem -M -R "@RG\tID:${myID}\tSM:${myID}" -t 1 /ei/projects/d/ddb748f8-e2d0-444c-a7f9-30680b49af25/data/banana-genome-hub.southgreen/Musa_acuminata_v4/Musa_acuminata_pahang_v4.fasta \
# <(gzip -dc ${DIR}/${myID}/basic/*_R1_val_1.fq.gz) <(gzip -dc ${DIR}/${myID}/basic/*_R2_val_2.fq.gz) \
#| samtools view -@ 1 -b -S -h - | samtools sort -@ 1 -T ${OUTDIR}/${myID}.tmp -o ${OUTDIR}/${myID}_musa_acumv4_sort.bam


#extra added by carolina 24 Oct 2023
source jre-8u144
source picardtools-2.1.1
java -jar /tgac/software/testing/picardtools/2.1.1/x86_64/bin/picard.jar \
MarkDuplicates INPUT=${OUTDIR}/${myID} OUTPUT=${OUTDIR}/${myID}_mdup.bam M={OUTDIR}/${myID}_mdup.txt
