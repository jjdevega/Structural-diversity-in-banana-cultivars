library("RColorBrewer")
library("ggplot2")

library(dplyr)
library(tidyr)


all<- read.csv ("groups_cov_median.csv", header = TRUE)

all$our_group<- factor(all$our_group, levels = all$our_group)

allrg <- gather(all,key,value,-our_group)

## now do both A and B
p <- ggplot(data=allrg,aes(x=our_group,y=value,fill = key))+  geom_bar(position="fill", stat="identity")

pl <- p + theme(axis.text.x=element_text(angle = 35, hjust = 1, size=10))

p1 <- pl + scale_fill_manual(values = c("dodgerblue","firebrick3"))

pdf(file = "AB_plot_gp_median.pdf",width =8, height = 8)
p1
dev.off()




# Create data
set.seed(1124)
data <- matrix(sample(1:30,15) , nrow=3)
colnames(data) <- c("A","B","C","D","E")
rownames(data) <- c("var1","var2","var3")

# create color palette:
library(RColorBrewer)
coul <- brewer.pal(3, "Pastel2") 

# Transform this data in %
data_percentage <- apply(data, 2, function(x){x*100/sum(x,na.rm=T)})

# Make a stacked barplot--> it will be in %!
barplot(data_percentage, col=coul , border="white", xlab="group")