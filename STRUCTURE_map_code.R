# Set working directory
setwd("C:/Users/newUser/Dropbox/Thailand bats/Thai_bats_STRUCTURE")

# Load necessart packages
library(reshape2)
library(ggplot2)

# Choose colors (based on ColorBrewer "Set1" palette)
cols<-c(Cp1="#984ea3", Cp2="#ff7f00", Cp3="#a65628",
        H1="#e41a1c", H2="#377eb8", H3="#4daf4a", 
        Tm="#f781bf")

# Read in data
map<-read.csv("Thai_bats_K7_clusters_consensus.csv",header=T)

# Reshape data into long format and order
meltmap<-melt(map, id.vars="Strain")

setwd("C:/Users/newUser/Dropbox/Thailand bats")

# Plot map
pdf("New_Fig4.pdf", height=8.5, width=11)
ggplot(data=meltmap, aes(x = Strain, y = value, fill=variable)) +
  geom_bar(stat='identity') +
  scale_fill_manual(values=cols, name="Population") +
  theme_bw(base_size=20) +
  coord_flip() +
  ylab("Proportion")
dev.off()
