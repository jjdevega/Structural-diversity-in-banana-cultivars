#!/bin/bash -e
#SBATCH -p ei-medium
#SBATCH -J filter
#SBATCH -N 1 # number of nodes
#SBATCH -c 1 # number of tasks
#SBATCH --mem 20G # memory pool for all cores
#SBATCH -o bcftools_fil.txt


source bcftools-1.10.2


bcftools filter -e 'GT="0/1" & FMT/AD == 1' -S "."  190sam_musa_acumv4_Haplotypecaller_diploid_BA_SNP_QUAL100_DP10_300_MISS3_MAF_01.vcf > 190sam_musa_acumv4_Haplotypecaller_diploid_BA_SNP_QUAL100_AD.vcf
 