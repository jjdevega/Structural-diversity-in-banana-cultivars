library(reshape)
library(ggplot2)

library(dplyr)
library(tidyr)

### input alignment stats for all references plus genotype and subtype metadata
## see details for mean alignment plots

data <- read.csv("all_ind_stats.csv")
str(data)
dim(data)

table(data$our_group)

mycolors_change <- c("dodgerblue","darkolivegreen","firebrick3","darkgoldenrod3")

plan <- subset(data,data$our_group == "Sucrier_AA")

write.csv(plan, "plan.csv")
order <- c("chr1","chr2","chr3","chr4","chr5","chr6","chr7","chr8","chr9","chr10","chr11")
plan$chrom <- factor(plan$chrom, levels = order)

### line plot of alignment stats
p<-ggplot(plan,aes(Taxa,percent))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=genome))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=6)) + xlab("") + ylab("percentage of properly paired reads mapped to each chromosome")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
p5 <- p4 + facet_wrap(~chrom)

pdf(file = "sucrier_align_percent.pdf",width=16,height=12)
p5
dev.off()

plan <- subset(data,data$our_group == "Cavendish_AAA")
order <- c("chr1","chr2","chr3","chr4","chr5","chr6","chr7","chr8","chr9","chr10","chr11")
plan$chrom <- factor(plan$chrom, levels = order)

### line plot of alignment stats
p<-ggplot(plan,aes(Taxa,percent))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=genome))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=6)) + xlab("") + ylab("percentage of properly paired reads mapped to each chromosome")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
p5 <- p4 + facet_wrap(~chrom)

pdf(file = "Cavendish_AAA_align_percent.pdf",width=12,height=12)
p5
dev.off()

plan <- subset(data,data$our_group == "GrosMichel_AAA")
order <- c("chr1","chr2","chr3","chr4","chr5","chr6","chr7","chr8","chr9","chr10","chr11")
plan$chrom <- factor(plan$chrom, levels = order)

### line plot of alignment stats
p<-ggplot(plan,aes(Taxa,percent))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=genome))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=6)) + xlab("") + ylab("percentage of properly paired reads mapped to each chromosome")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
p5 <- p4 + facet_wrap(~chrom)

pdf(file = "GrosMichel_AAA_percent.pdf",width=8,height=12)
p5
dev.off()

plan <- subset(data,data$our_group == "unknown_AAA")
#write.csv(plan, "d_AAA_GrosMichel_like")
order <- c("chr1","chr2","chr3","chr4","chr5","chr6","chr7","chr8","chr9","chr10","chr11")
plan$chrom <- factor(plan$chrom, levels = order)

### line plot of alignment stats
p<-ggplot(plan,aes(Taxa,percent))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=genome))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=6)) + xlab("") + ylab("percentage of properly paired reads mapped to each chromosome")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
p5 <- p4 + facet_wrap(~chrom)

pdf(file = "unknown_AAA_percent.pdf",width=6,height=12)
p5
dev.off()


plan <- subset(data,data$our_group == "Red_AAA")

order <- c("chr1","chr2","chr3","chr4","chr5","chr6","chr7","chr8","chr9","chr10","chr11")
plan$chrom <- factor(plan$chrom, levels = order)

### line plot of alignment stats
p<-ggplot(plan,aes(Taxa,percent))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=genome))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=6)) + xlab("") + ylab("percentage of properly paired reads mapped to each chromosome")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
p5 <- p4 + facet_wrap(~chrom)

pdf(file = "Red_AAA_percent.pdf",width=8,height=12)
p5
dev.off()

plan <- subset(data,data$our_group == "AAAA")

write.csv(plan, "f_cl6_AAAA")
order <- c("chr1","chr2","chr3","chr4","chr5","chr6","chr7","chr8","chr9","chr10","chr11")
plan$chrom <- factor(plan$chrom, levels = order)

### line plot of alignment stats
p<-ggplot(plan,aes(Taxa,percent))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=genome))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=6)) + xlab("") + ylab("percentage of properly paired reads mapped to each chromosome")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
p5 <- p4 + facet_wrap(~chrom)

pdf(file = "AAAA_align_percent.pdf",width=6,height=12)
p5
dev.off()

plan <- subset(data,data$our_group == "Mutika_AAA")

order <- c("chr1","chr2","chr3","chr4","chr5","chr6","chr7","chr8","chr9","chr10","chr11")
plan$chrom <- factor(plan$chrom, levels = order)

### line plot of alignment stats
p<-ggplot(plan,aes(Taxa,percent))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=genome))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=6)) + xlab("") + ylab("percentage of properly paired reads mapped to each chromosome")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
p5 <- p4 + facet_wrap(~chrom)

pdf(file = "Mutika_AAA_percent.pdf",width=6,height=12)
p5
dev.off()


plan <- subset(data,data$our_group == "AAAB_Pome")

write.csv(plan, "h_cl8_Plantain-like")
order <- c("chr1","chr2","chr3","chr4","chr5","chr6","chr7","chr8","chr9","chr10","chr11")
plan$chrom <- factor(plan$chrom, levels = order)

### line plot of alignment stats
p<-ggplot(plan,aes(Taxa,percent))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=genome))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=6)) + xlab("") + ylab("percentage of properly paired reads mapped to each chromosome")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
p5 <- p4 + facet_wrap(~chrom)

pdf(file = "AAAB_Pacific_align_percent.pdf",width=6,height=12)
p5
dev.off()



plan <- subset(data,data$our_group == "AAAB_Africa")

order <- c("chr1","chr2","chr3","chr4","chr5","chr6","chr7","chr8","chr9","chr10","chr11")
plan$chrom <- factor(plan$chrom, levels = order)

### line plot of alignment stats
p<-ggplot(plan,aes(Taxa,percent))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=genome))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=6)) + xlab("") + ylab("percentage of properly paired reads mapped to each chromosome")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
p5 <- p4 + facet_wrap(~chrom)

pdf(file = "AAAB_African_align_percent.pdf",width=6,height=12)
p5
dev.off()


plan <- subset(data,data$our_group == "Popoulu_AAB")

order <- c("chr1","chr2","chr3","chr4","chr5","chr6","chr7","chr8","chr9","chr10","chr11")
plan$chrom <- factor(plan$chrom, levels = order)

### line plot of alignment stats
p<-ggplot(plan,aes(Taxa,percent))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=genome))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=6)) + xlab("") + ylab("percentage of properly paired reads mapped to each chromosome")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
p5 <- p4 + facet_wrap(~chrom)

pdf(file = "Popoulu_AAB_align_percent.pdf",width=6,height=12)
p5
dev.off()




plan <- subset(data,data$our_group == "Plantain_AAB")

order <- c("chr1","chr2","chr3","chr4","chr5","chr6","chr7","chr8","chr9","chr10","chr11")
plan$chrom <- factor(plan$chrom, levels = order)

### line plot of alignment stats
p<-ggplot(plan,aes(Taxa,percent))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=genome))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=6)) + xlab("") + ylab("percentage of properly paired reads mapped to each chromosome")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
p5 <- p4 + facet_wrap(~chrom)

pdf(file = "Plantain_AAB_align_percent.pdf",width=18,height=12)
p5
dev.off()



plan <- subset(data,data$our_group == "Bluggoe_ABB")

order <- c("chr1","chr2","chr3","chr4","chr5","chr6","chr7","chr8","chr9","chr10","chr11")
plan$chrom <- factor(plan$chrom, levels = order)

### line plot of alignment stats
p<-ggplot(plan,aes(Taxa,percent))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=genome))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=6)) + xlab("") + ylab("percentage of properly paired reads mapped to each chromosome")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
p5 <- p4 + facet_wrap(~chrom)

pdf(file = "Bluggoe_ABB_align_percent.pdf",width=6,height=12)
p5
dev.off()



plan <- subset(data,data$our_group == "wild_species")

order <- c("chr1","chr2","chr3","chr4","chr5","chr6","chr7","chr8","chr9","chr10","chr11")
plan$chrom <- factor(plan$chrom, levels = order)

### line plot of alignment stats
p<-ggplot(plan,aes(Taxa,percent))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=genome))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=6)) + xlab("") + ylab("percentage of properly paired reads mapped to each chromosome")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
p5 <- p4 + facet_wrap(~chrom)

pdf(file = "wild_species_align__percent.pdf",width=10,height=12)
p5
dev.off()

plan <- subset(data,data$our_group == "Pelipita_ABB")

order <- c("chr1","chr2","chr3","chr4","chr5","chr6","chr7","chr8","chr9","chr10","chr11")
plan$chrom <- factor(plan$chrom, levels = order)

### line plot of alignment stats
p<-ggplot(plan,aes(Taxa,percent))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=genome))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=6)) + xlab("") + ylab("percentage of properly paired reads mapped to each chromosome")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
p5 <- p4 + facet_wrap(~chrom)

pdf(file = "ABB_Pelipita_align_percent.pdf",width=6,height=12)
p5
dev.off()

table(data$our_group)


unclust <- subset(data,data$our_group == "unclustered")

uorder <- read.csv("new_unclustered34_ordered.csv")

unclust$Taxa <- factor(unclust$Taxa, levels = uorder$Taxa)

order <- c("chr1","chr2","chr3","chr4","chr5","chr6","chr7","chr8","chr9","chr10","chr11")
unclust$chrom <- factor(unclust$chrom, levels = order)



### line plot of alignment stats
p<-ggplot(unclust,aes(Taxa,percent))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=genome))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=6)) + xlab("") + ylab("percentage of properly paired reads mapped to each chromosome")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
p5 <- p4 + facet_wrap(~chrom)

pdf(file = "unknown_align_percent_chrom.pdf",width=16,height=12)
p5
dev.off()

### line plot of alignment stats
p<-ggplot(unclust,aes(chrom,percent))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=genome))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=6)) + xlab("") + ylab("percentage of properly paired reads mapped to each chromosome")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
p5 <- p4 + facet_wrap(~Taxa)

pdf(file = "unknown_align_percent_taxa.pdf",width=16,height=12)
p5
dev.off()





