library(reshape)
library(ggplot2)

library(dplyr)
library(tidyr)

### input alignment stats for all references plus genotype and subtype metadata

### change colour of references
ABB <- read.csv("AAB_align_stats.csv")
str(data)
dim(data)
AA <- read.csv("Musa_acumv4_align_stats.csv")
BB <- read.csv("Musa_balbisiana_DH_PKW_v1.1_align_stats.csv")
SS <- read.csv("SS_align_stats.csv")

tog <- bind_cols(AA, "ABB" = ABB$ABB,"BB" = BB$BB_percent_pp,"SS" = SS$SS_pp_mapped)

write.csv(tog,"align_all.csv")

mtog <- melt(tog)

mycolors_change <- c("dodgerblue","darkolivegreen","firebrick3","darkgoldenrod3")


### geom point with jitter plot  of alignment stats
p<-ggplot(mtog,aes(our_group,value))

p1 <- p + geom_jitter(aes(colour=variable),size = 1,width = 0.1)

p2 <- p1 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10))+ xlab("") + ylab("percentage of properly paired reads aligned")

p3 <- p2 +  scale_color_manual(values=mycolors_change)

pdf(file = "align_AA_BB_ABB_SS_new.pdf",width=10,height=8)
p3
dev.off()

table(mtog$our_group)

sucrier <- subset(mtog,our_group == "a_cl1_Sucrier")

### point and line plot of alignment stats by group
p<-ggplot(sucrier,aes(SEQUENCING_ID,value))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=variable))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10)) + xlab("") + ylab("normalised percentage of properly paired reads mapped")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
pdf(file = "sucrier_align.pdf",width=8,height=6)
p4
dev.off()

cav <- subset(mtog,our_group == "b_cl2_Cavendish")

### point and line plot of alignment stats by group
p<-ggplot(cav,aes(SEQUENCING_ID,value))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=variable))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10)) + xlab("") + ylab("normalised percentage of properly paired reads mapped")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
pdf(file = "cav_align.pdf",width=8,height=6)
p4
dev.off()

gm <- subset(mtog,our_group == "c_cl3_GrosMichel")

### point and line plot of alignment stats by group
p<-ggplot(gm,aes(SEQUENCING_ID,value))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=variable))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10)) + xlab("") + ylab("normalised percentage of properly paired reads mapped")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
pdf(file = "GrosMichel_align.pdf",width=8,height=6)
p4
dev.off()


gml <- subset(mtog,our_group == "c_cl4_GrosMichel")

### point and line plot of alignment stats by group
p<-ggplot(gml,aes(SEQUENCING_ID,value))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=variable))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10)) + xlab("") + ylab("normalised percentage of properly paired reads mapped")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
pdf(file = "gml_align.pdf",width=8,height=6)
p4
dev.off()



gml <- subset(mtog,our_group == "d_cl5_Red")

### point and line plot of alignment stats by group
p<-ggplot(gml,aes(SEQUENCING_ID,value))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=variable))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10)) + xlab("") + ylab("normalised percentage of properly paired reads mapped")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
pdf(file = "red_align.pdf",width=8,height=6)
p4
dev.off()



gml <- subset(mtog,our_group == "f_cl6_AAAA")

### point and line plot of alignment stats by group
p<-ggplot(gml,aes(SEQUENCING_ID,value))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=variable))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10)) + xlab("") + ylab("normalised percentage of properly paired reads mapped")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
pdf(file = "AAAA_align.pdf",width=8,height=6)
p4
dev.off()



gml <- subset(mtog,our_group == "g_cl7_Mutika_Lujugira")

### point and line plot of alignment stats by group
p<-ggplot(gml,aes(SEQUENCING_ID,value))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=variable))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10)) + xlab("") + ylab("normalised percentage of properly paired reads mapped")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
pdf(file = "mutika_align.pdf",width=8,height=6)
p4
dev.off()



gml <- subset(mtog,our_group == "h_c8_plantain-like")

### point and line plot of alignment stats by group
p<-ggplot(gml,aes(SEQUENCING_ID,value))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=variable))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10)) + xlab("") + ylab("normalised percentage of properly paired reads mapped")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
pdf(file = "pac_AAAB.pdf",width=8,height=6)
p4
dev.off()




gml <- subset(mtog,our_group == "i_cl9_AAAB")

### point and line plot of alignment stats by group
p<-ggplot(gml,aes(SEQUENCING_ID,value))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=variable))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10)) + xlab("") + ylab("normalised percentage of properly paired reads mapped")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
pdf(file = "africa_AAAB_align.pdf",width=8,height=6)
p4
dev.off()



gml <- subset(mtog,our_group == "k_cl10_MaiaMaoli_Popoulu")

### point and line plot of alignment stats by group
p<-ggplot(gml,aes(SEQUENCING_ID,value))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=variable))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10)) + xlab("") + ylab("normalised percentage of properly paired reads mapped")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
pdf(file = "popoulu.pdf",width=8,height=6)
p4
dev.off()

gml <- subset(mtog,our_group == "l_cl11_Plantain")

### point and line plot of alignment stats by group
p<-ggplot(gml,aes(SEQUENCING_ID,value))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=variable))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10)) + xlab("") + ylab("normalised percentage of properly paired reads mapped")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
pdf(file = "plantain_align.pdf",width=8,height=6)
p4
dev.off()



gml <- subset(mtog,our_group == "n_gp12_ABB_Bluggoe")

### point and line plot of alignment stats by group
p<-ggplot(gml,aes(SEQUENCING_ID,value))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=variable))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10)) + xlab("") + ylab("normalised percentage of properly paired reads mapped")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
pdf(file = "bluggoe_align.pdf",width=8,height=6)
p4
dev.off()

gml <- subset(mtog,our_group == "p_cl13_ABB_Pelipita")

### point and line plot of alignment stats by group
p<-ggplot(gml,aes(SEQUENCING_ID,value))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=variable))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10)) + xlab("") + ylab("normalised percentage of properly paired reads mapped")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
pdf(file = "pelipita_align.pdf",width=8,height=6)
p4
dev.off()




