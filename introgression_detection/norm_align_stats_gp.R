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

tog <- bind_cols(AA, "ABB" = ABB$ABB, "BB" = BB$BB_percent_pp,"SS" = SS$SS_pp_mapped)

write.csv(tog,"align_all.csv")

mycolors_change <- c("dodgerblue","darkolivegreen","firebrick3","darkgoldenrod3")


##**************
##* plot normalised
##*
##***************

cav <- subset(tog,tog$our_group == "b_cl2_Cavendish")

mABB <- mean(cav$ABB)
mAA <- mean(cav$AA)
mBB <- mean(cav$BB)
mSS <- mean(cav$SS)

cav1 <- bind_cols(cav,"normABB"=cav$ABB/mABB,"normAA"=cav$AA/mAA,"normBB"=cav$BB/mBB,"normSS"=cav$SS/mSS)

cav2 <- cav1 %>% mutate(nMean = rowMeans(select(., starts_with("norm"))))
cav3 <- bind_cols(cav2,"npp_AA"=cav2$AA/cav2$nMean,"npp_ABB"=cav2$ABB/cav2$nMean,"npp_BB"=cav2$BB/cav2$nMean,"npp_SS"=cav2$SS/cav2$nMean)

cav4 <- cav3 %>% select(SEQUENCING_ID,our_group,npp_AA,npp_ABB,npp_BB,npp_SS)

colnames(cav4) <- c("SEQUENCING_ID","our_group","AA","ABB","BB","SS")
mcav4 <- melt(cav4)
colnames(mcav4) <- c("SEQUENCING_ID","our_group","reference_genome","pp")

mycolors_change <- c("dodgerblue","darkolivegreen","firebrick3","darkgoldenrod3")

### point and line plot of alignment stats by group
p<-ggplot(mcav4,aes(SEQUENCING_ID,pp))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=reference_genome))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10)) + xlab("") + ylab("normalised percentage of properly paired reads mapped")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
pdf(file = "cav_norm_align.pdf",width=8,height=8)
p4
dev.off()

write.csv(cav4, "cavendish_norm.csv", row.names=FALSE )
cavendish <- cav4


cav <- subset(tog,tog$our_group == "l_cl11_Plantain")

mABB <- mean(cav$ABB)
mAA <- mean(cav$AA)
mBB <- mean(cav$BB)
mSS <- mean(cav$SS)

cav1 <- bind_cols(cav,"normABB"=cav$ABB/mABB,"normAA"=cav$AA/mAA,"normBB"=cav$BB/mBB,"normSS"=cav$SS/mSS)

cav2 <- cav1 %>% mutate(nMean = rowMeans(select(., starts_with("norm"))))
cav3 <- bind_cols(cav2,"npp_AA"=cav2$AA/cav2$nMean,"npp_ABB"=cav2$ABB/cav2$nMean,"npp_BB"=cav2$BB/cav2$nMean,"npp_SS"=cav2$SS/cav2$nMean)

cav4 <- cav3 %>% select(SEQUENCING_ID,our_group,npp_AA,npp_ABB,npp_BB,npp_SS)

colnames(cav4) <- c("SEQUENCING_ID","our_group","AA","ABB","BB","SS")
mcav4 <- melt(cav4)
colnames(mcav4) <- c("SEQUENCING_ID","our_group","reference_genome","pp")

mycolors_change <- c("dodgerblue","darkolivegreen","firebrick3","darkgoldenrod3")

### point and line plot of alignment stats by group
p<-ggplot(mcav4,aes(SEQUENCING_ID,pp))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=reference_genome))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10)) + xlab("") + ylab("normalised percentage of properly paired reads mapped")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
pdf(file = "plantain_norm_align.pdf",width=12,height=8)
p4
dev.off()

write.csv(cav4, "plantain_norm.csv",row.names=FALSE)
plantain <- cav4

cav <- subset(tog,tog$our_group == "a_cl1_Sucrier")
mABB <- mean(cav$ABB)
mAA <- mean(cav$AA)
mBB <- mean(cav$BB)
mSS <- mean(cav$SS)
cav1 <- bind_cols(cav,"normABB"=cav$ABB/mABB,"normAA"=cav$AA/mAA,"normBB"=cav$BB/mBB,"normSS"=cav$SS/mSS)
cav2 <- cav1 %>% mutate(nMean = rowMeans(select(., starts_with("norm"))))
cav3 <- bind_cols(cav2,"npp_AA"=cav2$AA/cav2$nMean,"npp_ABB"=cav2$ABB/cav2$nMean,"npp_BB"=cav2$BB/cav2$nMean,"npp_SS"=cav2$SS/cav2$nMean)
cav4 <- cav3 %>% select(SEQUENCING_ID,our_group,npp_AA,npp_ABB,npp_BB,npp_SS)
colnames(cav4) <- c("SEQUENCING_ID","our_group","AA","ABB","BB","SS")
mcav4 <- melt(cav4)
colnames(mcav4) <- c("SEQUENCING_ID","our_group","reference_genome","pp")

mycolors_change <- c("dodgerblue","darkolivegreen","firebrick3","darkgoldenrod3")

### point and line plot of alignment stats by group
p<-ggplot(mcav4,aes(SEQUENCING_ID,pp))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=reference_genome))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10)) + xlab("") + ylab("normalised percentage of properly paired reads mapped")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
pdf(file = "sucrier_norm_align.pdf",width=8,height=6)
p4
dev.off()

write.csv(cav4, "sucrier_norm.csv",row.names=FALSE)
sucrier <- cav4


cav <- subset(tog,tog$our_group == "c_cl3_GrosMichel")
mABB <- mean(cav$ABB)
mAA <- mean(cav$AA)
mBB <- mean(cav$BB)
mSS <- mean(cav$SS)
cav1 <- bind_cols(cav,"normABB"=cav$ABB/mABB,"normAA"=cav$AA/mAA,"normBB"=cav$BB/mBB,"normSS"=cav$SS/mSS)
cav2 <- cav1 %>% mutate(nMean = rowMeans(select(., starts_with("norm"))))
cav3 <- bind_cols(cav2,"npp_AA"=cav2$AA/cav2$nMean,"npp_ABB"=cav2$ABB/cav2$nMean,"npp_BB"=cav2$BB/cav2$nMean,"npp_SS"=cav2$SS/cav2$nMean)
cav4 <- cav3 %>% select(SEQUENCING_ID,our_group,npp_AA,npp_ABB,npp_BB,npp_SS)
colnames(cav4) <- c("SEQUENCING_ID","our_group","AA","ABB","BB","SS")
mcav4 <- melt(cav4)
colnames(mcav4) <- c("SEQUENCING_ID","our_group","reference_genome","pp")

mycolors_change <- c("dodgerblue","darkolivegreen","firebrick3","darkgoldenrod3")

### point and line plot of alignment stats by group
p<-ggplot(mcav4,aes(SEQUENCING_ID,pp))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=reference_genome))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10)) + xlab("") + ylab("normalised percentage of properly paired reads mapped")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
pdf(file = "grosmichel_norm_align.pdf",width=4,height=8)
p4
dev.off()

write.csv(cav4, "grosMichel_norm.csv",row.names=FALSE)
grosMichel <- cav4




cav <- subset(tog,tog$our_group == "p_cl13_ABB_Pelipita")

mABB <- mean(cav$ABB)
mAA <- mean(cav$AA)
mBB <- mean(cav$BB)
mSS <- mean(cav$SS)

cav1 <- bind_cols(cav,"normABB"=cav$ABB/mABB,"normAA"=cav$AA/mAA,"normBB"=cav$BB/mBB,"normSS"=cav$SS/mSS)

cav2 <- cav1 %>% mutate(nMean = rowMeans(select(., starts_with("norm"))))
cav3 <- bind_cols(cav2,"npp_AA"=cav2$AA/cav2$nMean,"npp_ABB"=cav2$ABB/cav2$nMean,"npp_BB"=cav2$BB/cav2$nMean,"npp_SS"=cav2$SS/cav2$nMean)

cav4 <- cav3 %>% select(SEQUENCING_ID,our_group,npp_AA,npp_ABB,npp_BB,npp_SS)
colnames(cav4) <- c("SEQUENCING_ID","our_group","AA","ABB","BB","SS")
mcav4 <- melt(cav4)
colnames(mcav4) <- c("SEQUENCING_ID","our_group","reference_genome","pp")

mycolors_change <- c("dodgerblue","darkolivegreen","firebrick3","darkgoldenrod3")

### point and line plot of alignment stats by group
p<-ggplot(mcav4,aes(SEQUENCING_ID,pp))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=reference_genome))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10)) + xlab("") + ylab("normalised percentage of properly paired reads mapped")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
pdf(file = "pelipita_norm_align.pdf",width=4,height=6)
p4
dev.off()

write.csv(cav4, "pelipita_norm.csv",row.names=FALSE)
pelipita <- cav4



cav <- subset(tog,tog$our_group == "k_cl10_MaiaMaoli_Popoulu")

mABB <- mean(cav$ABB)
mAA <- mean(cav$AA)
mBB <- mean(cav$BB)
mSS <- mean(cav$SS)

cav1 <- bind_cols(cav,"normABB"=cav$ABB/mABB,"normAA"=cav$AA/mAA,"normBB"=cav$BB/mBB,"normSS"=cav$SS/mSS)

cav2 <- cav1 %>% mutate(nMean = rowMeans(select(., starts_with("norm"))))
cav3 <- bind_cols(cav2,"npp_AA"=cav2$AA/cav2$nMean,"npp_ABB"=cav2$ABB/cav2$nMean,"npp_BB"=cav2$BB/cav2$nMean,"npp_SS"=cav2$SS/cav2$nMean)

cav4 <- cav3 %>% select(SEQUENCING_ID,our_group,npp_AA,npp_ABB,npp_BB,npp_SS)

colnames(cav4) <- c("SEQUENCING_ID","our_group","AA","ABB","BB","SS")
mcav4 <- melt(cav4)
colnames(mcav4) <- c("SEQUENCING_ID","our_group","reference_genome","pp")

mycolors_change <- c("dodgerblue","darkolivegreen","firebrick3","darkgoldenrod3")

### point and line plot of alignment stats by group
p<-ggplot(mcav4,aes(SEQUENCING_ID,pp))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=reference_genome))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10)) + xlab("") + ylab("normalised percentage of properly paired reads mapped")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
pdf(file = "poploulu_norm_align.pdf",width=4,height=6)
p4
dev.off()

write.csv(cav4, "popoulu_norm.csv",row.names=FALSE)
popoulu <- cav4


cav <- subset(tog,tog$our_group == "d_cl5_Red")

mABB <- mean(cav$ABB)
mAA <- mean(cav$AA)
mBB <- mean(cav$BB)
mSS <- mean(cav$SS)

cav1 <- bind_cols(cav,"normABB"=cav$ABB/mABB,"normAA"=cav$AA/mAA,"normBB"=cav$BB/mBB,"normSS"=cav$SS/mSS)

cav2 <- cav1 %>% mutate(nMean = rowMeans(select(., starts_with("norm"))))
cav3 <- bind_cols(cav2,"npp_AA"=cav2$AA/cav2$nMean,"npp_ABB"=cav2$ABB/cav2$nMean,"npp_BB"=cav2$BB/cav2$nMean,"npp_SS"=cav2$SS/cav2$nMean)

cav4 <- cav3 %>% select(SEQUENCING_ID,our_group,npp_AA,npp_ABB,npp_BB,npp_SS)

colnames(cav4) <- c("SEQUENCING_ID","our_group","AA","ABB","BB","SS")
mcav4 <- melt(cav4)
colnames(mcav4) <- c("SEQUENCING_ID","our_group","reference_genome","pp")

mycolors_change <- c("dodgerblue","darkolivegreen","firebrick3","darkgoldenrod3")

### point and line plot of alignment stats by group
p<-ggplot(mcav4,aes(SEQUENCING_ID,pp))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=reference_genome))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10)) + xlab("") + ylab("normalised percentage of properly paired reads mapped")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
pdf(file = "red_norm_align.pdf",width=6,height=8)
p4
dev.off()

write.csv(cav4, "red_norm.csv",row.names=FALSE)
red <- cav4

cav <- subset(tog,tog$our_group == "f_cl6_AAAA")

mABB <- mean(cav$ABB)
mAA <- mean(cav$AA)
mBB <- mean(cav$BB)
mSS <- mean(cav$SS)

cav1 <- bind_cols(cav,"normABB"=cav$ABB/mABB,"normAA"=cav$AA/mAA,"normBB"=cav$BB/mBB,"normSS"=cav$SS/mSS)

cav2 <- cav1 %>% mutate(nMean = rowMeans(select(., starts_with("norm"))))
cav3 <- bind_cols(cav2,"npp_AA"=cav2$AA/cav2$nMean,"npp_ABB"=cav2$ABB/cav2$nMean,"npp_BB"=cav2$BB/cav2$nMean,"npp_SS"=cav2$SS/cav2$nMean)

cav4 <- cav3 %>% select(SEQUENCING_ID,our_group,npp_AA,npp_ABB,npp_BB,npp_SS)

colnames(cav4) <- c("SEQUENCING_ID","our_group","AA","ABB","BB","SS")
mcav4 <- melt(cav4)
colnames(mcav4) <- c("SEQUENCING_ID","our_group","reference_genome","pp")

mycolors_change <- c("dodgerblue","darkolivegreen","firebrick3","darkgoldenrod3")

### point and line plot of alignment stats by group
p<-ggplot(mcav4,aes(SEQUENCING_ID,pp))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=reference_genome))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10)) + xlab("") + ylab("normalised percentage of properly paired reads mapped")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
pdf(file = "AAAA_norm_align.pdf",width=4,height=8)
p4
dev.off()

write.csv(cav4, "AAAA_norm.csv",row.names=FALSE)
AAAA <- cav4



cav <- subset(tog,tog$our_group == "h_c8_plantain-like")

mABB <- mean(cav$ABB)
mAA <- mean(cav$AA)
mBB <- mean(cav$BB)
mSS <- mean(cav$SS)

cav1 <- bind_cols(cav,"normABB"=cav$ABB/mABB,"normAA"=cav$AA/mAA,"normBB"=cav$BB/mBB,"normSS"=cav$SS/mSS)

cav2 <- cav1 %>% mutate(nMean = rowMeans(select(., starts_with("norm"))))
cav3 <- bind_cols(cav2,"npp_AA"=cav2$AA/cav2$nMean,"npp_ABB"=cav2$ABB/cav2$nMean,"npp_BB"=cav2$BB/cav2$nMean,"npp_SS"=cav2$SS/cav2$nMean)

cav4 <- cav3 %>% select(SEQUENCING_ID,our_group,npp_AA,npp_ABB,npp_BB,npp_SS)

colnames(cav4) <- c("SEQUENCING_ID","our_group","AA","ABB","BB","SS")
mcav4 <- melt(cav4)
colnames(mcav4) <- c("SEQUENCING_ID","our_group","reference_genome","pp")

mycolors_change <- c("dodgerblue","darkolivegreen","firebrick3","darkgoldenrod3")

### point and line plot of alignment stats by group
p<-ggplot(mcav4,aes(SEQUENCING_ID,pp))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=reference_genome))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10)) + xlab("") + ylab("normalised percentage of properly paired reads mapped")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
pdf(file = "AAAB_pacific_norm_align.pdf",width=4,height=8)
p4
dev.off()

write.csv(cav4, "AAAB_P_norm.csv",row.names=FALSE)
AAAB_P <- cav4



cav <- subset(tog,tog$our_group == "i_cl9_AAAB")

mABB <- mean(cav$ABB)
mAA <- mean(cav$AA)
mBB <- mean(cav$BB)
mSS <- mean(cav$SS)

cav1 <- bind_cols(cav,"normABB"=cav$ABB/mABB,"normAA"=cav$AA/mAA,"normBB"=cav$BB/mBB,"normSS"=cav$SS/mSS)

cav2 <- cav1 %>% mutate(nMean = rowMeans(select(., starts_with("norm"))))
cav3 <- bind_cols(cav2,"npp_AA"=cav2$AA/cav2$nMean,"npp_ABB"=cav2$ABB/cav2$nMean,"npp_BB"=cav2$BB/cav2$nMean,"npp_SS"=cav2$SS/cav2$nMean)

cav4 <- cav3 %>% select(SEQUENCING_ID,our_group,npp_AA,npp_ABB,npp_BB,npp_SS)

colnames(cav4) <- c("SEQUENCING_ID","our_group","AA","ABB","BB","SS")
mcav4 <- melt(cav4)
colnames(mcav4) <- c("SEQUENCING_ID","our_group","reference_genome","pp")

mycolors_change <- c("dodgerblue","darkolivegreen","firebrick3","darkgoldenrod3")

### point and line plot of alignment stats by group
p<-ggplot(mcav4,aes(SEQUENCING_ID,pp))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=reference_genome))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10)) + xlab("") + ylab("normalised percentage of properly paired reads mapped")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
pdf(file = "AAAB_africa_norm_align.pdf",width=4,height=8)
p4
dev.off()

write.csv(cav4, "AAAB_A_norm.csv",row.names=FALSE)
AAAB_A <- cav4



cav <- subset(tog,tog$our_group == "g_cl7_Mutika_Lujugira")

mABB <- mean(cav$ABB)
mAA <- mean(cav$AA)
mBB <- mean(cav$BB)
mSS <- mean(cav$SS)

cav1 <- bind_cols(cav,"normABB"=cav$ABB/mABB,"normAA"=cav$AA/mAA,"normBB"=cav$BB/mBB,"normSS"=cav$SS/mSS)

cav2 <- cav1 %>% mutate(nMean = rowMeans(select(., starts_with("norm"))))
cav3 <- bind_cols(cav2,"npp_AA"=cav2$AA/cav2$nMean,"npp_ABB"=cav2$ABB/cav2$nMean,"npp_BB"=cav2$BB/cav2$nMean,"npp_SS"=cav2$SS/cav2$nMean)

cav4 <- cav3 %>% select(SEQUENCING_ID,our_group,npp_AA,npp_ABB,npp_BB,npp_SS)

colnames(cav4) <- c("SEQUENCING_ID","our_group","AA","ABB","BB","SS")
mcav4 <- melt(cav4)
colnames(mcav4) <- c("SEQUENCING_ID","our_group","reference_genome","pp")

mycolors_change <- c("dodgerblue","darkolivegreen","firebrick3","darkgoldenrod3")

### point and line plot of alignment stats by group
p<-ggplot(mcav4,aes(SEQUENCING_ID,pp))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=reference_genome))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10)) + xlab("") + ylab("normalised percentage of properly paired reads mapped")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
pdf(file = "mutika_norm_align.pdf",width=4,height=8)
p4
dev.off()

write.csv(cav4, "mutika_norm.csv",row.names=FALSE)
mutika <- cav4


cav <- subset(tog,tog$our_group == "c_cl4_GrosMichel")

mABB <- mean(cav$ABB)
mAA <- mean(cav$AA)
mBB <- mean(cav$BB)
mSS <- mean(cav$SS)

cav1 <- bind_cols(cav,"normABB"=cav$ABB/mABB,"normAA"=cav$AA/mAA,"normBB"=cav$BB/mBB,"normSS"=cav$SS/mSS)

cav2 <- cav1 %>% mutate(nMean = rowMeans(select(., starts_with("norm"))))
cav3 <- bind_cols(cav2,"npp_AA"=cav2$AA/cav2$nMean,"npp_ABB"=cav2$ABB/cav2$nMean,"npp_BB"=cav2$BB/cav2$nMean,"npp_SS"=cav2$SS/cav2$nMean)

cav4 <- cav3 %>% select(SEQUENCING_ID,our_group,npp_AA,npp_ABB,npp_BB,npp_SS)

colnames(cav4) <- c("SEQUENCING_ID","our_group","AA","ABB","BB","SS")
mcav4 <- melt(cav4)
colnames(mcav4) <- c("SEQUENCING_ID","our_group","reference_genome","pp")

mycolors_change <- c("dodgerblue","darkolivegreen","firebrick3","darkgoldenrod3")

### point and line plot of alignment stats by group
p<-ggplot(mcav4,aes(SEQUENCING_ID,pp))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=reference_genome))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10)) + xlab("") + ylab("normalised percentage of properly paired reads mapped")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
pdf(file = "unknownAAA_norm_align.pdf",width=4,height=8)
p4
dev.off()

write.csv(cav4, "unknownAAA_norm.csv",row.names=FALSE)


cav <- subset(tog,tog$our_group == "n_gp12_ABB_Bluggoe")

mABB <- mean(cav$ABB)
mAA <- mean(cav$AA)
mBB <- mean(cav$BB)
mSS <- mean(cav$SS)

cav1 <- bind_cols(cav,"normABB"=cav$ABB/mABB,"normAA"=cav$AA/mAA,"normBB"=cav$BB/mBB,"normSS"=cav$SS/mSS)

cav2 <- cav1 %>% mutate(nMean = rowMeans(select(., starts_with("norm"))))
cav3 <- bind_cols(cav2,"npp_AA"=cav2$AA/cav2$nMean,"npp_ABB"=cav2$ABB/cav2$nMean,"npp_BB"=cav2$BB/cav2$nMean,"npp_SS"=cav2$SS/cav2$nMean)

cav4 <- cav3 %>% select(SEQUENCING_ID,our_group,npp_AA,npp_ABB,npp_BB,npp_SS)

colnames(cav4) <- c("SEQUENCING_ID","our_group","AA","ABB","BB","SS")
mcav4 <- melt(cav4)
colnames(mcav4) <- c("SEQUENCING_ID","our_group","reference_genome","pp")

mycolors_change <- c("dodgerblue","darkolivegreen","firebrick3","darkgoldenrod3")

### point and line plot of alignment stats by group
p<-ggplot(mcav4,aes(SEQUENCING_ID,pp))
p1 <- p + geom_line(col = "grey60")
p2 <- p1 + geom_point(aes(colour=reference_genome))
p3 <- p2 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10)) + xlab("") + ylab("normalised percentage of properly paired reads mapped")
p4 <- p3 +  scale_color_manual(values=mycolors_change)
pdf(file = "bluggoe_norm_align.pdf",width=4,height=8)
p4
dev.off()

write.csv(cav4, "bluggoe_norm.csv",row.names=FALSE)


bluggoe<- read.csv("bluggoe_norm.csv")
mutika<- read.csv("mutika_norm.csv")
red<- read.csv("red_norm.csv")
sucrier <- read.csv("sucrier_norm.csv")
cavendish <- read.csv("cavendish_norm.csv")
grosMichel <- read.csv("grosMichel_norm.csv")
plantain <- read.csv("plantain_norm.csv")
popoulu <- read.csv("popoulu_norm.csv")
pelipita <- read.csv("pelipita_norm.csv")
AAAA <- read.csv("AAAA_norm.csv")
AAAB_P <- read.csv("AAAB_P_norm.csv")
AAAB_A <- read.csv("AAAB_A_norm.csv")
unknown <- read.csv("unknownAAA_norm.csv")

all <- bind_rows(unknown,sucrier,cavendish,grosMichel,red,AAAA,AAAB_P,AAAB_A,plantain,popoulu,pelipita,mutika,bluggoe)

mall <- melt(all)

colnames(mall) <- c("SEQUENCING_ID","our_group","reference_genome","pp")

### geom point with jitter plot  of alignment stats
p<-ggplot(mall,aes(our_group,pp))

p1 <- p + geom_jitter(aes(colour=reference_genome),size = 1,width = 0.1)

p2 <- p1 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10))+ xlab("") + ylab("percentage of properly paired reads aligned")

p3 <- p2 +  scale_color_manual(values=mycolors_change)

pdf(file = "align_AA_BB_ABB_SS.pdf",width=10,height=8)
p3
dev.off()



