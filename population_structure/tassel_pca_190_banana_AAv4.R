
setwd("~/OneDrive - Norwich BioScience Institutes/Banana_paper_March22/pca188/AA_repeats")

library(pca3d)
library(RColorBrewer)
library(reshape)
library(ggplot2)
library(dplyr)
library(tidyr)

display.brewer.all(colorblindFriendly = TRUE)

display.brewer.pal(12, "Paired")
brewer.pal(n = 12, name = "Paired")

display.brewer.pal(8, "Dark2")
brewer.pal(n = 8, name = "Dark2")

display.brewer.pal(8, "YlGnBu")
brewer.pal(n = 8, name = "YlGnBu")

display.brewer.pal(8, "OrRd")
brewer.pal(n = 8, name = "OrRd")

display.brewer.pal(8, "Blues")
brewer.pal(n = 8, name = "Blues")

display.brewer.pal(8, "PuRd")
brewer.pal(n = 8, name = "PuRd")

display.brewer.pal(8, "Purples")
brewer.pal(n = 8, name = "Purples")

display.brewer.pal(8, "GnBu")
brewer.pal(n = 8, name = "GnBu")

display.brewer.pal(8, "YlGn")
brewer.pal(n = 8, name = "YlGn")

display.brewer.pal(8, "Greys")
brewer.pal(n = 8, name = "Greys")


display.brewer.pal(8, "Reds")
brewer.pal(n = 8, name = "Reds")


display.brewer.pal(8, "BuPu")
brewer.pal(n = 8, name = "BuPu")

pop_info <- read.csv("metadata_13_clusters_pop.csv")

## need to read this in again otherwise it retains species that are no longer presesnt
pca2<-read.csv("188_sam_musa_acumv41.csv",header=T)
head(pca2)
pca2d(as.matrix(pca2[,2:3]),show.labels = pca2$Taxa)

## now add samples details

order <- data.frame(pca2$Taxa)
colnames(order)<- "Taxa"

pca_pops <- left_join(order, pop_info, by = "Taxa")

pop_col <-pca_pops$group_col
table(pop_col)


#pdf(file = "188_187133_AAv4.pdf", width = 10, height = 8)
pca2d(as.matrix(pca2[,2:3]),show.plane = T,show.labels = FALSE,col=pop_col,bg="grey90",radius = 0.8)
legend("topleft",legend= c("Sucrier AA","Cavendish AAA","GrosMichel AAA","unknown AAA","Red AAA","Mutika AAA","AAAA","AAAB Pome","AAAB Africa","Popoulu AAB","Plantain AAB","Bluggoe ABB","Pelipita ABB","wild species","unclustered"),
       col=c("#E7298A","#33A02C","#D95F02","#6E016B","#E31A1C","#6A3D9A","#6BAED6","#B15928","#990000","#EF6548","#1F78B4","#0C2C84","#1B9E77","#FB9A99","#808080"),cex=1,pch=16,
       box.lty=1, box.col="black")
#dev.off()


#JDV"


col=c("#6BAED6", "#990000", "#B15928", "#0C2C84", "#33A02C", "#D95F02", "#6A3D9A", "#1B9E77", "#1F78B4", "#EF6548", "#E31A1C", "#E7298A", "#808080", "#6E016B", "#e9d700", "black", "#FB9A99")

plot1<- ggplot(pca2,aes(x=PC1,y=PC2,colour=pca_pops$our_group)) + theme_linedraw() +
  geom_point(aes(fill=pca_pops$our_group),shape=21,colour="black", alpha=0.8, size=4) +  
  scale_fill_discrete(type=col)
plot1
ggsave(filename = "new_new_188_187133_AAv4.pdf", plot = plot1, device = "png", dpi = 320, scale=1, width = 8.6, height = 6.2)

### now plot with lable
#pdf(file = "188_187133_AAv4_label.pdf", width = 40, height = 30)
pca2d(as.matrix(pca2[,2:3]),show.plane = T,show.labels = pca_pops$Taxa,col=pop_col,bg="grey90",radius = 0.8)
legend("topleft",legend= c("Sucrier AA","Cavendish AAA","GrosMichel AAA","unknown AAA","Red AAA","Mutika AAA","AAAA","AAAB_Pome","AAAB Africa","Popoulu AAB","Plantain AAB","Bluggeo ABB","Pelipita ABB","wild species","unclustered"),
       col=c("#E7298A","#33A02C","#D95F02","#6E016B","#E31A1C","#6A3D9A","#6BAED6","#B15928","#990000","#EF6548","#1F78B4","#0C2C84","#1B9E77","#FB9A99","#808080"),cex=1,pch=16,
       box.lty=1, box.col="black")
#dev.off()


### now just plot the 144 samples in 11 clusters

pop_info <- read.csv("142_metadata_11_cluster.csv")

## need to read this in again otherwise it retains species that are no longer presesnt
AA <-read.csv("188_sam_musa_acumv41.csv",header=T)
head(AA)
pca2d(as.matrix(AA[,2:3]),show.labels = pca2$Taxa)

pca_pops <- left_join(pop_info, AA, by = "Taxa")


pop_col <-pca_pops$group_col
table(pop_col)


#pdf(file = "142_187133_AAv4_type.pdf", width = 10, height = 8)
pca2d(as.matrix(pca_pops[,14:15]),show.plane = T,show.labels = FALSE,col=pop_col,bg="grey90",radius = 0.8)
legend("topright",legend= c("Sucrier AA","Cavendish AAA","GrosMichel AAA","unknown AAA","Red AAA","Mutika AAA","AAAA","AAAB Pome","AAAB Africa","Popoulu AAB","Plantain AAB"),
       col=c("#E7298A","#33A02C","#D95F02","#6E016B","#E31A1C","#6A3D9A","#6BAED6","#B15928","#990000","#EF6548","#1F78B4"),cex=1,pch=16,
       box.lty=1, box.col="black")
#dev.off()

#JDV"

col2=c("#6BAED6", "#990000", "#B15928", "#33A02C", "#D95F02", "#6A3D9A", "#1F78B4", "#EF6548", "#E31A1C", "#E7298A", "#6E016B", "#e9d700")

plot2<- ggplot(pca_pops[,14:15],aes(x=PC1,y=PC2,colour=pca_pops$our_group)) + theme_linedraw() +
  geom_point(aes(fill=pca_pops$our_group),shape=21,colour="black", alpha=0.8, size=4) +  
  scale_fill_discrete(type=col2)
plot2
ggsave(filename = "new_new_142_187133_AAv4_type.pdf", plot = plot2, device = "png", dpi = 320, scale=1, width = 8.6, height = 6.2)



