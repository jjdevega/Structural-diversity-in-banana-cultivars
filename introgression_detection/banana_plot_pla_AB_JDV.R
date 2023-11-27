library("RColorBrewer")
library("ggplot2")

library(dplyr)
library(tidyr)
library(stringr)

#### plot median
all<- read.delim ("gp8_PlantainList.txt_unique_pp.bam.bedgraph_median_cov.txt", header = FALSE)
colnames(all) <- c("chrom","start","end","cov")

all$cov <- as.numeric(all$cov)
all$cov[is.na(all$cov)] <- 1
allc <- cbind(all,"covPerSam" = all$cov/55) #divide by number of samples 
#not used, replace by mean genome, but need the object allc


Achr01<- allc %>% filter(grepl('^chr', chrom))
mean(Achr01$cov)
mean(Achr01$covPerSam)
#[1]   3.034611

#dividing by its mean is going to center the distribution around 1 instead around mean(x):
Achr01$covNormByMean <- Achr01$cov/mean(Achr01$cov)  *1 # ploidy adjutment, copies of A
mean(Achr01$covNormByMean)
#1.4

Bchr01<- allc %>% filter(grepl('^Bchr', chrom))
mean(Bchr01$cov)
mean(Bchr01$covPerSam)
#2.138452
Bchr01$covNormByMean <- Bchr01$cov/mean(Bchr01$cov)  # ploidy adjutment, copies of B
mean(Bchr01$covNormByMean)


## make B negative and remove B from chromosome
all.neg <- function(x) -1*abs(x)

# Bchr01neg <- cbind(Bchr01,"cov_neg" = all.neg(Bchr01$covPerSam))
# 
# Bnes <- Bchr01neg %>%
#   mutate(chrom = str_replace(chrom,"^Bchr","chr"))


Bchr01neg <- cbind(Bchr01,"cov_neg" = all.neg(Bchr01$covNormByMean))

Bnes <- Bchr01neg %>%
  mutate(chrom = str_replace(chrom,"^Bchr","chr"))



#######################
###replot with syntheny
#######################
#read minimap aligbnments:
minimap <- read.delim("BB_100kbwindows-over-AAv4.longest_alignmentotal.paf", header=F)
minimap <- minimap[,c(1,6,8,9)]
colnames(minimap) <- c("uniqID","inAA_chr","inAA_start","inAA_stop")
#create id field in Bchr01neg
Bchr01neg$uniqID <- paste0(Bchr01neg$chrom,":",Bchr01neg$start,"-",Bchr01neg$end)

#join left both dataframes
Bchr01negJOIN <- merge(x=Bchr01neg, y=minimap, by="uniqID", all.x = FALSE) #false to ignore BBs without AA homologous

Achr01$facet <- Achr01$chrom
Bchr01negJOIN$facet <- Bchr01negJOIN$inAA_chr



p <- ggplot() + geom_bar(data=Achr01,aes(x=start,y=covNormByMean), stat = "identity",color="dodgerblue")
pg <- p + geom_bar(data=Bchr01negJOIN,aes(x=inAA_start,y=cov_neg), stat = "identity",color="firebrick3")
pgx <- pg + coord_cartesian(ylim = c(-2,3)) + theme(axis.text = element_text(size = 5))  
pgxl <- pgx + geom_hline(yintercept=0, linetype="solid", color = "gray40")
pgxk <- pgxl + geom_hline(yintercept=c(0.5,1,1.5,2), linetype="solid", color = "gray30", alpha=0.3)
pgxm <- pgxk + geom_hline(yintercept=c(-0.5,-1,-1.5,-2), linetype="solid", color = "gray30", alpha=0.3)
pgsw <- pgxm + facet_wrap(~facet,ncol=1,strip.position = "right")
pgs <- pgsw + theme_classic()
pgs




###SAME WITH BB AS REFERENCE (ALSO SWAPPING TOP AND BOTTOM BUT NOT COLOURS):

Achr01neg <- cbind(Achr01,"cov_neg" = all.neg(Achr01$covNormByMean))

minimapBB <- read.delim("AAv4_100kbwindows-over-BB.paf.longest_alignmentotal.paf", header=F)
minimapBB <- minimapBB[,c(1,6,8,9)]
colnames(minimapBB) <- c("uniqID","inBB_chr","inBB_start","inBB_stop")
#create id field in Bchr01neg
Achr01neg$uniqID <- paste0(Achr01neg$chrom,":",Achr01neg$start,"-",Achr01neg$end)

#join left both dataframes
Achr01negJOIN <- merge(x=Achr01neg, y=minimapBB, by="uniqID", all.x = FALSE) #false to ignore BBs without AA homologous
Achr01negJOIN$facet <- Achr01negJOIN$inBB_chr

Bchr01$facet <- Bchr01$chrom


p <- ggplot() + geom_bar(data=Bchr01,aes(x=start,y=covNormByMean), stat = "identity",color="firebrick3")
pg <- p + geom_bar(data=Achr01negJOIN,aes(x=inBB_start,y=cov_neg), stat = "identity",color="dodgerblue")
pgx <- pg + coord_cartesian(ylim = c(-2,3)) + theme(axis.text = element_text(size = 5))  
pgxl <- pgx + geom_hline(yintercept=0, linetype="solid", color = "gray40")
pgxk <- pgxl + geom_hline(yintercept=c(0.5,1,1.5,2), linetype="solid", color = "gray30", alpha=0.3)
pgxm <- pgxk + geom_hline(yintercept=c(-0.5,-1,-1.5,-2), linetype="solid", color = "gray30", alpha=0.3)
pgsw <- pgxm + facet_wrap(~facet,ncol=1,strip.position = "right")
pgs <- pgsw + theme_classic()
pgs
#600x800

