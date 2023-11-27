library("RColorBrewer")
library("ggplot2")
library(reshape) 
library(dplyr)
library(tidyr)


pcaPalette <- c("#E7298A","#33A02C","#1F78B4","#0C2C84","darkorange","#E31A1C")


###  plot K6 only

K6<- read.csv("K6_ordered_new.csv",header=TRUE)

K6$nssp <- factor(K6$nssp, levels = K6$nssp)

K6rg <- gather(K6,key,value,-nssp,-pops,-group_col,-order,-our_group,-Taxa)

#plot pop proportion
cog<-ggplot(data=K6rg, aes(x=nssp, y=value, fill=key)) +
  geom_bar(stat="identity")
cog3 <- cog +theme(axis.text.x=element_text(angle = 55, hjust = 1, size=3))+ylab ("Genotype") + scale_y_continuous(expand = c(0,0)) 
cog4 <- cog3 + scale_fill_manual(values=pcaPalette)

pdf(file = "plot_aa_K6_new.pdf",width=10,height=5)
cog4
dev.off()






### plot unknown
K6<- read.csv("K6_unclustered34.csv",header=TRUE)

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
