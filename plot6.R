## Download file from Coursera

setwd('./R')
url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'
download.file(url, destfile='./raw.zip')
unzip("raw.zip", exdir = ".")


library(ggplot2)
NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS("Source_Classification_Code.rds")

sub1 <- subset(NEI, fips == "06037" & type=="ON-ROAD")
sub2 <- subset(NEI, fips == "24510" & type=="ON-ROAD")
baltmore <- aggregate(sub2[c("Emissions")], list(type = sub2$type, year = sub2$year, zip = sub2$fips), sum)
la <- aggregate(sub1[c("Emissions")], list(type = sub1$type, year = sub1$year, zip = sub1$fips), sum)
comp.mv <- rbind(baltmore, la)

qplot(year, Emissions, data = comp.mv, color = zip, geom= "line", ylim = c(0, 5000))+ 
      ggtitle("MV Emissions in Baltimore (24510) vs LA (06037) Counties")+ 
      xlab("Year")+ ylab("Emission Levels")  

