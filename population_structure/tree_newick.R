setwd("~/analysis/banana-coverage-plots/tree_snprelate")

library(gdsfmt)
library(SNPRelate) 
library(ggplot2)
library(ggtree)
library(ape)
library(DECIPHER)

genofile<-snpgdsOpen("190sam_musa_acumv4_Haplotypecaller_diploid_BA_SNP_QUAL100_AD_MAF01_MISS3.vcf.gds")

#Calculate the fraction of identity by state for each pair of samples
ibs <- snpgdsIBS(genofile,autosome.only=FALSE)

hclust <- snpgdsHCluster(ibs, hang=0)
snpgdsDrawTree(hclust,horiz=T, type="dendrogram")
WriteDendrogram(hclust$dendrogram,"ibs.newick.txt")


#Calculate the individual dissimilarities for each pair of individuals.
dissMatrix  <- snpgdsDiss(genofile , autosome.only=F)

hclust <- snpgdsHCluster(dissMatrix, hang=0)
snpgdsDrawTree(hclust,horiz=T, type="dendrogram")
WriteDendrogram(hclust$dendrogram,"diss.newick.txt")
