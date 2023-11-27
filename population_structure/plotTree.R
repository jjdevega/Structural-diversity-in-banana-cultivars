

library(gdsfmt)
library(SNPRelate) 
library(ggplot2)
library(ggtree)
library(ape)
library(DECIPHER)

Agenofile<-snpgdsOpen("188_sam_musa_acumv4_Haplotypecaller_ploidy3_BA_SNP_QUAL100_DP10_300_MISS3_MAF_01.gds")

#Calculate the fraction of identity by state for each pair of samples
ibs <- snpgdsIBS(Agenofile,autosome.only=FALSE)

hclust <- snpgdsHCluster(ibs, hang=0)
snpgdsDrawTree(hclust,horiz=T, type="dendrogram")
WriteDendrogram(hclust$dendrogram,"AA_ibs.newick.txt")


#Calculate the individual dissimilarities for each pair of individuals.
dissMatrix  <- snpgdsDiss(Agenofile , autosome.only=F)

hclust <- snpgdsHCluster(dissMatrix, hang=0)
snpgdsDrawTree(hclust,horiz=T, type="dendrogram")
WriteDendrogram(hclust$dendrogram,"AA_diss.newick.txt")





Bgenofile<-snpgdsOpen("188_sam_balb_DH_PKW_Haplotypecaller_ploidy3_BA_SNP_QUAL100_DP10_DP300_MISS3_MAF_01.gds")
#Calculate the fraction of identity by state for each pair of samples
ibs <- snpgdsIBS(Bgenofile,autosome.only=FALSE)

hclust <- snpgdsHCluster(ibs, hang=0)
snpgdsDrawTree(hclust,horiz=T, type="dendrogram")
WriteDendrogram(hclust$dendrogram,"BB_ibs.newick.txt")


#Calculate the individual dissimilarities for each pair of individuals.
dissMatrix  <- snpgdsDiss(Bgenofile , autosome.only=F)

hclust <- snpgdsHCluster(dissMatrix, hang=0)
snpgdsDrawTree(hclust,horiz=T, type="dendrogram")
WriteDendrogram(hclust$dendrogram,"BB_diss.newick.txt")



