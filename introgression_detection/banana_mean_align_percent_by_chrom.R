library(reshape)
library(ggplot2)
library(dplyr)
library(tidyr)

### get align stats per chromosome by separating the chromosomes in the bam file
#and running bamtools stats

### using pandas in iPython  AA_norm_stats.ipynb, SS_norm_stats.ipynb
##  add cluster details and total reads
## put together stats for each sample and calculate mean for each cluster
## add chr in excel

## plot mean data - for only the 13 clusters
data <- read.csv("13gp_mean_stats.csv")
str(data)
dim(data)

order <- c("chr1","chr2","chr3","chr4","chr5","chr6","chr7","chr8","chr9","chr10","chr11")
data$chrom <- factor(data$chrom, levels = order)

gorder <- c("Sucrier_AA","Cavendish_AAA","GrosMichel_AAA","unknown_AAA","Red_AAA","Mutika_AAA","AAAA","AAAB_Pome","AAAB_Africa","Popoulu_AAB","Plantain_AAB","Bluggoe_ABB","Pelipita_ABB")
data$our_group <- factor(data$our_group, levels = gorder)

mycolors_change <- c("dodgerblue","darkolivegreen","firebrick3","darkgoldenrod3")

### point and line plot of alignment stats by group
p<-ggplot(data,aes(chrom,percentage))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=reference))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10)) + xlab("") + ylab("percentage of properly paired reads mapped to each chromosome")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
p5 <- p4 + facet_wrap(~our_group)

#pdf(file = "align_gp13_percent.pdf",width=12,height=12)
p5
#dev.off()






### point and line plot of alignment stats by group
p<-ggplot(data,aes(our_group,percentage))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=reference), alpha=0.7)
p3 <- p2 + theme_grey() + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10)) + xlab("") + ylab("")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
p5 <- p4 + facet_wrap(~chrom, ncol=4)

pdf(file = "horizontal_align_gp13_percent_by_chrom.pdf",width=8.5,height=6)
p5
dev.off()


## plot the 10 cultivar clusters

data <- read.csv("gp10_mean_stats.csv")
str(data)
dim(data)

order <- c("chr1","chr2","chr3","chr4","chr5","chr6","chr7","chr8","chr9","chr10","chr11")
data$chrom <- factor(data$chrom, levels = order)

gorder <- c("Sucrier_AA","Cavendish_AAA","GrosMichel_AAA","unknown_AAA","Red_AAA","Mutika_AAA","Popoulu_AAB","Plantain_AAB","Bluggoe_ABB","Pelipita_ABB")
data$our_group <- factor(data$our_group, levels = gorder)

mycolors_change <- c("dodgerblue","darkolivegreen","firebrick3","darkgoldenrod3")

### point and line plot of alignment stats by chromosome
p<-ggplot(data,aes(our_group,percentage))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=reference))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10)) + xlab("") + ylab("percentage of properly paired reads mapped to each chromosome")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
p5 <- p4 + facet_wrap(~chrom)

#pdf(file = "gp10_chrom_align_percent.pdf",width=12,height=6)
p5
#dev.off()

### point and line plot of alignment stats by group
p<-ggplot(data,aes(chrom,percentage))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=reference))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10)) + xlab("") + ylab("percentage of properly paired reads mapped to each chromosome")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
p5 <- p4 + facet_wrap(~our_group, nrow=2)

#pdf(file = "gp10_chrom_align_percent_by_chrom.pdf",width=12,height=8)
p5
#dev.off()



data <- read.csv("syn3_mean_stats.csv")
str(data)
dim(data)

order <- c("chr1","chr2","chr3","chr4","chr5","chr6","chr7","chr8","chr9","chr10","chr11")
data$chrom <- factor(data$chrom, levels = order)

gorder <- c("AAAA","AAAB_Pome","AAAB_Africa")
data$our_group <- factor(data$our_group, levels = gorder)

mycolors_change <- c("dodgerblue","darkolivegreen","firebrick3","darkgoldenrod3")


### point and line plot of alignment stats by chromosome
p<-ggplot(data,aes(our_group,percentage))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=reference))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=8)) + xlab("") + ylab("percentage of properly paired reads mapped to each chromosome")
p4 <- p3 + theme(axis.title = element_text(size = 6))  
p5 <- p4 +  scale_color_manual(values=mycolors_change)
p6 <- p5 + facet_wrap(~chrom, nrow = 1)

pdf(file = "syn_chrom_align_percent.pdf",width=9,height=3)
p6
dev.off()

### point and line plot of alignment stats by group
p<-ggplot(data,aes(chrom,percentage))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=reference))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10)) + xlab("") + ylab("percentage of properly paired reads mapped to each chromosome")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
p5 <- p4 + facet_wrap(~our_group, nrow=2)

pdf(file = "3_syn_align_percent_gen_line.pdf",width=8,height=8)
p5
dev.off()


