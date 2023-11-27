library("RColorBrewer")
library("ggplot2")
library(reshape) 
library(dplyr)
library(tidyr)

## order files

### order for AA K6  
order<- read.csv("../plot6_AA/K6_ordered_final.csv",header=TRUE)

#BB <- read.csv("K6_balb_structure-order_plot.csv",header = TRUE)
BB <- read.csv("bb_K6_new_ordered_plot.csv",header = TRUE)


# output K6 in same order as 
all <-left_join(order,BB,by = "nssp")
write.csv(all,"K6_BB_ordered_withAA.csv")

## do this in Excell
#tog <- rbind(order,BB)
#write.csv(all,"K6_AA_BB_ordered.csv")

both<- read.csv("K6_AA_BB_ordered.csv",header=TRUE)

AA <- subset(both, both$pops == "K6_AA")
BB <- subset(both, both$pops == "K6_BB")
write.csv(BB,"K6_BB_final_ordered.csv")


allrg <- gather(both,key,value,-nssp,-pops,-Taxa)

allrg$nssp <- factor(allrg$nssp, levels = AA$nssp)

pcaPalette <- c("#E7298A","#33A02C","#1F78B4","#0C2C84","darkorange","#E31A1C")


#plot pop proportion
cog<-ggplot(data=allrg, aes(x=nssp, y=value, fill=key)) +
  geom_bar(stat="identity")
cog3 <- cog +theme(axis.text.x=element_text(angle = 55, hjust = 1, size=3))+ylab ("Proportion") + xlab ("")  + scale_y_continuous(expand = c(0,0)) 
cog4 <- cog3 + scale_fill_manual(values=pcaPalette)
cog5 <- cog4 +     facet_wrap(~pops,nrow=2) 

pdf(file = "plot_aa_bb_K6.pdf",width=10,height=6)
cog5
dev.off()



BBrg <- gather(BB,key,value,-nssp,-pops)

BBrg$nssp <- factor(BBrg$nssp, levels = BB$nssp)


#plot pop proportion
cog<-ggplot(data=BBrg, aes(x=nssp, y=value, fill=key)) +
  geom_bar(stat="identity")
cog3 <- cog +theme(axis.text.x=element_text(angle = 55, hjust = 1, size=3))+ylab ("Proportion") + xlab ("")  + scale_y_continuous(expand = c(0,0)) 
cog4 <- cog3 + scale_fill_manual(values=pcaPalette)

pdf(file = "plot_BB_K6.pdf",width=10,height=5)
cog4
dev.off()


AArg <- gather(AA,key,value,-nssp,-pops)

AArg$nssp <- factor(AArg$nssp, levels = AA$nssp)


#plot pop proportion
cog<-ggplot(data=AArg, aes(x=nssp, y=value, fill=key)) +
  geom_bar(stat="identity")
cog3 <- cog +theme(axis.text.x=element_text(angle = 55, hjust = 1, size=3))+ylab ("Proportion") + xlab ("") + scale_y_continuous(expand = c(0,0)) 
cog4 <- cog3 + scale_fill_manual(values=pcaPalette)

pdf(file = "plot_AA_K6.pdf",width=10,height=5)
cog4
dev.off()








### unclustered_plot
uorder<- read.csv("new_unclustered34_ordered.csv",header=TRUE)

BB <- read.csv("K6_balb_structure-order_plot.csv",header = TRUE)

# output K6 in same order as 
unclust <-left_join(uorder,BB,by = "nssp")
#write.csv(unclust,"K6_BB_34_unclustered.csv")




### plot unknown
K6<- read.csv("K6_BB_34_unclustered.csv",header=TRUE)

K6$nssp <- factor(K6$nssp, levels = K6$nssp)

K6rg <- gather(K6,key,value,-nssp,-pops,-Taxa)

#plot pop proportion
cog<-ggplot(data=K6rg, aes(x=nssp, y=value, fill=key)) +
  geom_bar(stat="identity")
cog3 <- cog +theme(axis.text.x=element_text(angle = 90, hjust = 1, size=8))+ylab ("Genotype") + scale_y_continuous(expand = c(0,0)) 
cog4 <- cog3 + scale_fill_manual(values=pcaPalette)

pdf(file = "BB_new_plot_unclustered_K6.pdf",width=10,height=5)
cog4
dev.off()








##### more plots

###  plot K6 only

K6<- read.csv("K6_ordered.csv",header=TRUE)

K6$nssp <- factor(K6$nssp, levels = K6$nssp)

K6rg <- gather(K6,key,value,-nssp,-pops,-group_col,-order,-our_group,-Taxa)

#plot pop proportion
cog<-ggplot(data=K6rg, aes(x=nssp, y=value, fill=key)) +
  geom_bar(stat="identity")
cog3 <- cog +theme(axis.text.x=element_text(angle = 55, hjust = 1, size=3))+ylab ("Genotype") + scale_y_continuous(expand = c(0,0)) 
cog4 <- cog3 + scale_fill_manual(values=pcaPalette)

pdf(file = "plot_aa_K6.pdf",width=10,height=4)
cog4
dev.off()


### plot unknown
K6<- read.csv("K6_unclustered35.csv",header=TRUE)

K6$nssp <- factor(K6$nssp, levels = K6$nssp)

K6rg <- gather(K6,key,value,-nssp,-pops,-order,-our_group,-group_col,-Taxa)

#plot pop proportion
cog<-ggplot(data=K6rg, aes(x=nssp, y=value, fill=key)) +
  geom_bar(stat="identity")
cog3 <- cog +theme(axis.text.x=element_text(angle = 90, hjust = 1, size=8))+ylab ("Genotype") + scale_y_continuous(expand = c(0,0)) 
cog4 <- cog3 + scale_fill_manual(values=pcaPalette)

pdf(file = "plot_unclustered_K6.pdf",width=10,height=4)
cog4
dev.off()



### order unknown for alignPlot

uk <- read.csv("unknown.csv")
li <- inner_join(K6,uk, by = "Taxa")
head(li)
write.csv(li,"unknown_align.csv")

head(uk)
head(K6)







subset(K6,K6$pops="gp_unknown")


### K5,6,7,8
## remove columns, add Q labels and read back in
K5<- read.csv("K5_abb_order.csv",header=TRUE)
K6<- read.csv("K6_abb_order.csv",header=TRUE)
K7<- read.csv("K7_abb_ordered.csv",header=TRUE)
K8<- read.csv("K8_abb_order.csv",header=TRUE)

dim(K5)
dim(K6)
dim(K7)
dim(K8)


all <- rbind(K5,K6,K7,K8)


dim(all)

all$nssp <- factor(K5$nssp, levels = K5$nssp)

allrg <- gather(all,key,value,-nssp,-pops)

pcaPalette <- c("lightblue","royalblue","darkorchid","forestgreen","darkred","darkorange","hotpink","plum1")

#plot pop proportion
cog<-ggplot(data=allrg, aes(x=nssp, y=value, fill=key)) +
  geom_bar(stat="identity")
cog3 <- cog +theme(axis.text.x=element_text(angle = 55, hjust = 1, size=5))+ylab ("Genotype") + scale_y_continuous(expand = c(0,0)) 
cog4 <- cog3 + scale_fill_manual(values=pcaPalette)
cog5 <- cog4 +     facet_wrap(~pops,nrow=4) 

pdf(file = "plot_K5_6_7_8_abb.pdf",width=18,height=8)
cog5
dev.off()



###  plot K6 only

K6$nssp <- factor(K6$nssp, levels = K6$nssp)

K6rg <- gather(K6,key,value,-nssp,-pops)


#plot pop proportion
cog<-ggplot(data=K6rg, aes(x=nssp, y=value, fill=key)) +
  geom_bar(stat="identity")
cog3 <- cog +theme(axis.text.x=element_text(angle = 55, hjust = 1, size=5))+ylab ("Genotype") + scale_y_continuous(expand = c(0,0)) 
cog4 <- cog3 + scale_fill_manual(values=pcaPalette)


pdf(file = "plot_abb_K6.pdf",width=10,height=4)
cog4
dev.off()



### plot missing


#order missing
ABBmiss<- read.csv("missing_abb.csv",header=TRUE)

order <- read.csv("190_order_for_plot.csv",header = TRUE)

# output K6 in same order as K5
all <-left_join(order,ABBmiss,by = "sTaxa")
write.csv(all,"ABBmiss_ordered.csv")

#order missing
AAmiss<- read.csv("AA_miss.csv",header=TRUE)

order <- read.csv("190_order_for_plot.csv",header = TRUE)

# output K6 in same order as K5
all <-left_join(order,AAmiss,by = "nssp")
write.csv(all,"AAmiss_ordered.csv")


## plot missing
AAmiss<- read.csv("AA_miss_order.csv",header=TRUE)
ABBmiss<- read.csv("ABB_miss_order.csv",header=TRUE)
#BBmiss<- read.csv("K7_abb_ordered.csv",header=TRUE)

all <- rbind(AAmiss,ABBmiss)

dim(all)

all$nssp <- factor(AAmiss$nssp, levels = AAmiss$nssp)

allrg <- gather(all,key,value,-nssp,-pops)

pcaPalette <- c("lightblue","royalblue","darkorchid","forestgreen","darkred","darkorange","hotpink","plum1")

#plot pop proportion
cog<-ggplot(data=allrg, aes(x=nssp, y=value, fill=key)) +
  geom_bar(stat="identity")
cog3 <- cog +theme(axis.text.x=element_text(angle = 55, hjust = 1, size=5))+ylab ("Genotype") + scale_y_continuous(expand = c(0,0)) 
cog4 <- cog3 + scale_fill_manual(values=pcaPalette)
cog5 <- cog4 +     facet_wrap(~pops,nrow=4) 

pdf(file = "plot_missing.pdf",width=18,height=8)
cog5
dev.off()



### plot AA and  ABB ref for K6

AA<- read.csv("K6_aa_order.csv",header=TRUE)
ABB<- read.csv("K6_abb_order.csv",header=TRUE)
BB<- read.csv("K6_BB_order.csv",header=TRUE)

all <- rbind(AA,BB,ABB)

all$nssp <- factor(all$nssp, levels = AA$nssp)

allrg <- gather(all,key,value,-nssp,-pops)

pcaPalette <- c("lightblue","royalblue","darkorchid","forestgreen","darkred","darkorange","hotpink","plum1")

#plot pop proportion
cog<-ggplot(data=allrg, aes(x=nssp, y=value, fill=key)) +
  geom_bar(stat="identity")
cog3 <- cog +theme(axis.text.x=element_text(angle = 55, hjust = 1, size=3))+ylab ("Genotype") + scale_y_continuous(expand = c(0,0)) 
cog4 <- cog3 + scale_fill_manual(values=pcaPalette)
cog5 <- cog4 +     facet_wrap(~pops,nrow=4) 

pdf(file = "plot_K6_aa_bb_abb.pdf",width=16,height=8)
cog5
dev.off()



###  plot other species
other<- read.csv("otherSpecies.csv",header=TRUE)

other$nssp <- factor(other$nssp, levels = other$nssp)

othrg <- gather(other,key,value,-nssp,-pops)


#plot pop proportion
cog<-ggplot(data=othrg, aes(x=nssp, y=value, fill=key)) +
  geom_bar(stat="identity")
cog3 <- cog +theme(axis.text.x=element_text(angle = 55, hjust = 1, size=5))+ylab ("Genotype") + scale_y_continuous(expand = c(0,0)) 
cog4 <- cog3 + scale_fill_manual(values=pcaPalette)
cog5 <- cog4 +     facet_wrap(~pops,nrow=4) 

pdf(file = "other_K8.pdf",width=8,height=6)
cog5
dev.off()



### order K6  BB
BB<- read.csv("BB_pops.csv",header=TRUE)

order <- read.csv("190_order_for_plot.csv",header = TRUE)

# output K6 in same order as 
all <-left_join(order,BB,by = "sTaxa")
write.csv(all,"BB_ordered.csv")

#order missing
AAmiss<- read.csv("AA_miss.csv",header=TRUE)

order <- read.csv("190_order_for_plot.csv",header = TRUE)

# output K6 in same order as K5
all <-left_join(order,AAmiss,by = "nssp")
write.csv(all,"AAmiss_ordered.csv")



