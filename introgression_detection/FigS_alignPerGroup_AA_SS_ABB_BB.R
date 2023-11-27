library(reshape)
library(ggplot2)

library(dplyr)
library(tidyr)

### input alignment stats for all references plus genotype and subtype metadata

data <- read.csv("align_all_for_figS.csv")
str(data)
dim(data)

order <- c("Sucrier AA","Cavendish AAA","GrosMichel AAA","unknown AAA","Red AAA","Mutika AAA","AAAA","AAAB Pome","AAAB Africa","Popoulu AAB","Plantain AAB","Bluggoe ABB","Pelipita ABB","wild_species","unclustered")

data$our_group <- factor(data$our_group, levels = order)

### boxplot of alignment stats
p<-ggplot(data,aes(our_group,AA))
p1 <- p + geom_boxplot(outlier.shape = NA) + geom_jitter(size=1.5, width = 0.05,aes(colour=our_group)) + theme(text = element_text(size=10))

p2 <- p1 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10))
p3 <- p2 + scale_color_manual(values=c("#E7298A","#33A02C","#D95F02","#6E016B","#E31A1C","#6A3D9A","#6BAED6","#B15928","#990000","#EF6548","#1F78B4","#0C2C84","#1B9E77","#FB9A99","#808080"))

pdf(file = "AA_align_gp13.pdf",width=10,height=6)
p3
dev.off()


### boxplot of alignment stats
p<-ggplot(data,aes(our_group,BB))
p1 <- p + geom_boxplot(outlier.shape = NA) + geom_jitter(size=1.5, width = 0.05,aes(colour=our_group)) + theme(text = element_text(size=10))

p2 <- p1 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10))
p3 <- p2 + scale_color_manual(values=c("#E7298A","#33A02C","#D95F02","#6E016B","#E31A1C","#6A3D9A","#6BAED6","#B15928","#990000","#EF6548","#1F78B4","#0C2C84","#1B9E77","#FB9A99","#808080"))

pdf(file = "BB_align_gp13.pdf",width=10,height=6)
p3
dev.off()



### boxplot of alignment stats
p<-ggplot(data,aes(our_group,ABB))
p1 <- p + geom_boxplot(outlier.shape = NA) + geom_jitter(size=1.5, width = 0.05,aes(colour=our_group)) + theme(text = element_text(size=10))

p2 <- p1 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10))
p3 <- p2 + scale_color_manual(values=c("#E7298A","#33A02C","#D95F02","#6E016B","#E31A1C","#6A3D9A","#6BAED6","#B15928","#990000","#EF6548","#1F78B4","#0C2C84","#1B9E77","#FB9A99","#808080"))

pdf(file = "ABB_align_gp13.pdf",width=10,height=6)
p3
dev.off()



### boxplot of alignment stats
p<-ggplot(data,aes(our_group,SS))
p1 <- p + geom_boxplot(outlier.shape = NA) + geom_jitter(size=1.5, width = 0.05,aes(colour=our_group)) + theme(text = element_text(size=10))

p2 <- p1 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10))
p3 <- p2 + scale_color_manual(values=c("#E7298A","#33A02C","#D95F02","#6E016B","#E31A1C","#6A3D9A","#6BAED6","#B15928","#990000","#EF6548","#1F78B4","#0C2C84","#1B9E77","#FB9A99","#808080"))

pdf(file = "SS_align_gp13.pdf",width=10,height=6)
p3
dev.off()



