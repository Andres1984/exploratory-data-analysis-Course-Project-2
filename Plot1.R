EA<-setwd("C:/Users/mmartinezp5/Documents/testdir/exdata_data_NEI_data")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_sampling <- NEI[sample(nrow(NEI), size=2000, replace=F), ]


Emissions <- aggregate(NEI[, 'Emissions'], by=list(NEI$year), FUN=sum)
Emissions$PM <- round(Emissions[,2]/1000,2)


png(filename='C:/Users/mmartinezp5/Documents/testdir/exdata_data_NEI_data/plot1.png')

barplot(Emissions$PM, names.arg=Emissions$Group.1, 
        main=expression('Emisión Total de PM'[2.5]),
        xlab='Año', ylab=expression(paste('PM', ''[2.5], ' en Kilotones')))

dev.off()



