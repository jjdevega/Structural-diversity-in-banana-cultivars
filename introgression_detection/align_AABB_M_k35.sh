#!/bin/bash -e
#SBATCH -p ei-long
#SBATCH -N 1 # number of nodes
#SBATCH -J AABBSS
#SBATCH -c 1 # number of tasks
#SBATCH --mem 20G # memory pool for all cores

myID=$1

DIR=/ei/projects/d/ddb748f8-e2d0-444c-a7f9-30680b49af25/scratch/higginsj/trimmed_reads
OUTDIR=/ei/projects/d/ddb748f8-e2d0-444c-a7f9-30680b49af25/scratch/higginsj/align_refAABB_bwa-meml35
 
source bwa-0.7.17
source samtools-1.7

 
bwa mem -M -k 35 -R "@RG\tID:${myID}\tSM:${myID}" -t 1 /ei/projects/d/ddb748f8-e2d0-444c-a7f9-30680b49af25/scratch/higginsj/referenceAABB/AABB.fa \
 <(gzip -dc ${DIR}/${myID}/basic/*_R1_val_1.fq.gz) <(gzip -dc ${DIR}/${myID}/basic/*_R2_val_2.fq.gz) \
| samtools view -@ 1 -b -S -h - | samtools sort -@ 1 -T ${OUTDIR}/${myID}.tmp -o ${OUTDIR}/${myID}_AABB_sort.bam

