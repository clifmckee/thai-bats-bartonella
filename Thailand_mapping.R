setwd("~/Dropbox/Thailand bats")

library(ggplot2)
library(reshape2)
library(gridExtra)

Thailand1=readRDS("THA_adm1.rds")
mycolors <- rep("lightgrey", dim(Thailand1@data)[1])
mycolors[c(11, 15, 17, 55)] <- "black"

plot(Thailand1, col = mycolors, border = 'darkgrey')
text(x=Thailand1@polygons[[11]]@labpt[1]+1, Thailand1@polygons[[11]]@labpt[2]+1,
     labels="Chiang Rai", cex=1)
lines(x=c(Thailand1@polygons[[11]]@labpt[1], Thailand1@polygons[[11]]@labpt[1]+1),
      y=c(Thailand1@polygons[[11]]@labpt[2], Thailand1@polygons[[11]]@labpt[2]+0.7))
text(x=Thailand1@polygons[[15]]@labpt[1]-3, Thailand1@polygons[[15]]@labpt[2],
     labels="Kamphaeng Phet", cex=1)
lines(x=c(Thailand1@polygons[[15]]@labpt[1], Thailand1@polygons[[15]]@labpt[1]-1.2),
      y=c(Thailand1@polygons[[15]]@labpt[2], Thailand1@polygons[[15]]@labpt[2]))
text(x=Thailand1@polygons[[17]]@labpt[1]+3, Thailand1@polygons[[17]]@labpt[2]+2,
     labels="Khon Kaen", cex=1)
lines(x=c(Thailand1@polygons[[17]]@labpt[1], Thailand1@polygons[[17]]@labpt[1]+3),
      y=c(Thailand1@polygons[[17]]@labpt[2], Thailand1@polygons[[17]]@labpt[2]+1.7))
text(x=Thailand1@polygons[[55]]@labpt[1]+1.5, Thailand1@polygons[[55]]@labpt[2]-0.5,
     labels="Sa Kaeo", cex=1)
lines(x=c(Thailand1@polygons[[55]]@labpt[1], Thailand1@polygons[[55]]@labpt[1]+1.5),
      y=c(Thailand1@polygons[[55]]@labpt[2], Thailand1@polygons[[55]]@labpt[2]-0.2))

prevalence = read.csv("Thai_bats_prevalence.csv")
m.prevalence = melt(prevalence[,1:3])

pdf("Thai_species_barplot.pdf", width=8, height=8)
ggplot(data=m.prevalence, aes(x=Province, y=value, group=Species, fill=Species)) +
  geom_bar(stat="identity") +
  theme_classic(base_size=12) +
  ylim(0, 45) +
  ylab("Count") +
  scale_fill_brewer(palette="Dark2") +
  theme(axis.line.x=element_blank(),
        axis.line.y=element_blank(),
        axis.ticks.x=element_line(colour='black'),
        axis.ticks.y=element_line(colour='black'),
        axis.title.x=element_text(colour='black'),
        axis.title.y=element_text(colour='black'),
        panel.border=element_rect(colour='black', fill=NA),
        axis.text.x=element_text(angle=0, colour='black'))
dev.off()
