library(reshape)
library(ggplot2)

library(dplyr)
library(tidyr)

mycolors_change <- c("dodgerblue","darkolivegreen","firebrick3","darkgoldenrod3")



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

p1 <- p + geom_jitter(aes(colour=reference_genome),size = 1,width = 0.1) + 

p2 <- p1 + theme(axis.text.x=element_text(angle = 90, hjust = 1, size=10))+ xlab("") + ylab("normalised percentage of properly paired reads aligned")

p3 <- p2 +  scale_color_manual(values=mycolors_change)

pdf(file = "Fig3_new_align_norm_AA_BB_ABB_SS.pdf",width=10,height=5)
p3
dev.off()



