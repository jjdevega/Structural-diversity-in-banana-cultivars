#!/bin/bash -e
#SBATCH -p ei-medium
#SBATCH -J filter
#SBATCH -N 1 # number of nodes
#SBATCH -c 1 # number of tasks
#SBATCH --mem 20G # memory pool for all cores
#SBATCH -o bcftools_out.txt


source bcftools-1.9

#bcftools stats 190sam_balb_DH_PKW_Haplotypecaller_ploidy3.vcf > 190sam_balb_DH_PKW_Haplotypecaller_ploidy3_stats.txt

#bcftools view -m2 -M2 -v snps 190sam_balb_DH_PKW_Haplotypecaller_ploidy3.vcf > 190sam_balb_DH_PKW_Haplotypecaller_ploidy3_BA_SNP.vcf


#bcftools stats 190sam_balb_DH_PKW_Haplotypecaller_ploidy3_BA_SNP.vcf > 190sam_balb_DH_PKW_Haplotypecaller_ploidy3_BA_SNP.txt

#bcftools filter -i 'QUAL>100' 190sam_balb_DH_PKW_Haplotypecaller_ploidy3_BA_SNP.vcf  > 190sam_balb_DH_PKW_Haplotypecaller_ploidy3_BA_SNP_QUAL100.vcf

#bcftools stats 190sam_balb_DH_PKW_Haplotypecaller_ploidy3_BA_SNP_QUAL100.vcf  > 190sam_balb_DH_PKW_Haplotypecaller_ploidy3_BA_SNP_QUAL100_stats.txt


#bcftools filter -e "FMT/DP<10" -S "." 190sam_balb_DH_PKW_Haplotypecaller_ploidy3_BA_SNP_QUAL100.vcf > 190sam_balb_DH_PKW_Haplotypecaller_ploidy3_BA_SNP_QUAL100_DP10.vcf


#bcftools filter -e "FMT/DP>300" -S "." 190sam_balb_DH_PKW_Haplotypecaller_ploidy3_BA_SNP_QUAL100_DP10.vcf> 190sam_balb_DH_PKW_Haplotypecaller_ploidy3_BA_SNP_QUAL100_DP10_DP300.vcf






#bcftools filter -i 'MAF[0]>0.01' 190sam_balb_DH_PKW_Haplotypecaller_ploidy3_BA_SNP_QUAL100_DP10_DP300_MISS3.vcf > 190sam_balb_DH_PKW_Haplotypecaller_ploidy3_BA_SNP_QUAL100_DP10_DP300_MISS3_MAF_01.vcf

#bcftools stats 190sam_balb_DH_PKW_Haplotypecaller_ploidy3_BA_SNP_QUAL100_DP10_DP300_MISS3.vcf > 190sam_balb_DH_PKW_Haplotypecaller_ploidy3_BA_SNP_QUAL100_DP10_DP300_MISS3_stats.txt

bcftools stats 190sam_balb_DH_PKW_Haplotypecaller_ploidy3_BA_SNP_QUAL100_DP10_DP300_MISS9.vcf > R_190sam_balb_DH_PKW_Haplotypecaller_ploidy3_BA_SNP_QUAL100_DP10_DP300_MISS9_stats.txt


#bcftools stats 190sam_balb_DH_PKW_Haplotypecaller_ploidy3_BA_SNP_QUAL100_DP10_DP300_MISS3_MAF_01.vcf > 190sam_balb_DH_PKW_Haplotypecaller_ploidy3_BA_SNP_QUAL100_DP10_DP300_MISS3_MAF_01_stats.txt

#bcftools query -H -f '%CHROM\t%POS\t%REF\t%ALT\t%AF[\t%GT]\n' 190sam_balb_DH_PKW_Haplotypecaller_ploidy3_BA_SNP_QUAL100_DP10_DP300_MISS3_MAF_01.vcf  > 190sam_balb_DH_PKW_Haplotypecaller_ploidy3_BA_SNP_QUAL100_DP10_DP300_MISS3_MAF_01_dos.txt

#bcftools query -H -f '%CHROM\t%POS\t%REF\t%ALT[\t%TGT]\n' 190sam_balb_DH_PKW_Haplotypecaller_ploidy3_BA_SNP_QUAL100_DP10_DP300_MISS3_MAF_01.vcf  > 190sam_balb_DH_PKW_Haplotypecaller_ploidy3_BA_SNP_QUAL100_DP10_DP300_MISS3_MAF_01_geno.txt





