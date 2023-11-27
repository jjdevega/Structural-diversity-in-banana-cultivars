library(pophelper)
library(ggplot2)
library(gridExtra)
library(grid)
library(ggplot2)
library(lattice)

#https://github.com/royfrancis/pophelper
#install.packages(c("ggplot2","gridExtra","label.switching","tidyr","remotes"),repos="https://cloud.r-project.org")
#remotes::install_github('royfrancis/pophelper')

# check version
packageDescription("pophelper", fields="Version")
[1] "2.3.1"

########     readQ for admixturenm ###########

sfiles <- list.files("structure_K2_10_rep10", full.names=T)

slist <- readQ(files=sfiles,filetype="structure")
## check files
attributes(slist)
# check class of ouput
class(slist)
# view head of first converted file
head(slist[[1]])

#tr1 <- tabulateQ(qlist=slist)
#sr1 <- summariseQ(tr1)

sr1 <- summariseQ(tabulateQ(slist))

# another usage
#em <- evannoMethodStructure(summariseQ(tabulateQ(slist)))

# to export a plot
evannoMethodStructure(data=sr1,exportplot=T,exportpath=getwd())

# do not compute plot, only return results as table
em <- evannoMethodStructure(data=sr1,exportplot=F,returnplot=F)

# to export plot and table
evannoMethodStructure(data=sr1,exportplot=T,writetable=T,na.rm=T,exportpath=getwd())

# returns both data and plot
p <- evannoMethodStructure(data=sr1,exportplot=F,returnplot=T)

# to return only plot and save it
p <- evannoMethodStructure(data=sr1,exportplot=F,returnplot=T,returndata=F)

p <- evannoMethodStructure(data=sr1,exportplot=F,returnplot=T,returndata=F,basesize=12,linesize=0.7)
grid.arrange(p)



## get aligned data
xlist <- alignK(alist)

clumppExport(qlist=xlist, prefix="aa", exportpath=getwd())










