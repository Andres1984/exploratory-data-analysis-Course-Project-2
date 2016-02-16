EA<-setwd("C:/Users/mmartinezp5/Documents/testdir/exdata_data_NEI_data")


library(plyr)
library(ggplot2)

# Read the data file
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

# Assume "Motor Vehicles" only means on road
BaltimoreCityMV <- subset(NEI, fips == "24510" & type=="ON-ROAD")

BaltimoreMVPM25ByYear <- ddply(BaltimoreCityMV, .(year), function(x) sum(x$Emissions))
colnames(BaltimoreMVPM25ByYear)[2] <- "Emissions"

png('C:/Users/mmartinezp5/Documents/testdir/exdata_data_NEI_data/plot5.png')
qplot(year, Emissions, data=BaltimoreMVPM25ByYear, geom="line") +
  ggtitle(expression("Baltimore City" ~ PM[2.5] ~ "Motor Vehiculo Emisiones por año")) +
  xlab("Año") +
  ylab(expression("Total" ~ PM[2.5] ~ "Emisiones (tons)"))
dev.off()