#!/bin/bash -e
#SBATCH -p ei-medium
#SBATCH -N 1 # number of nodes
#SBATCH -c 1 # number of tasks
#SBATCH -J mkdup # number of tasks
#SBATCH --mem 60G # memory pool for all cores
#SBATCH -x t384n3
#SBATCH --constraint="intel"

mySAMN=$1

source picardtools-2.1.1

java -jar -Xmx50g -Xms50g /tgac/software/testing/picardtools/2.1.1/x86_64/bin/picard.jar MarkDuplicates INPUT=${mySAMN} OUTPUT=${mySAMN}.mdup.bam M=${mySAMN}.mdup.txt
