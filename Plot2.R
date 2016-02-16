EA<-setwd("C:/Users/mmartinezp5/Documents/testdir/exdata_data_NEI_data")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")



NEI_sampling <- NEI[sample(nrow(NEI), size=5000, replace=F), ]


MD <- subset(NEI, fips=='24510')



png(filename='C:/Users/mmartinezp5/Documents/testdir/exdata_data_NEI_data/plot2.png')

barplot(tapply(X=MD$Emissions, INDEX=MD$year, FUN=sum), 
        main='Emisión Total en la Ciudad de Baltimore, MD', 
        xlab='Año', ylab=expression('PM'[2.5]))

dev.off()