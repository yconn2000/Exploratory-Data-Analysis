## Download file from Coursera

setwd('./R')
url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'
download.file(url, destfile='./raw.zip')
unzip("raw.zip", exdir = ".")


NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)
sub1 <- subset(NEI, fips == "24510")
sources <- aggregate(sub1[c("Emissions")], list(type = sub1$type, year = sub1$year), sum)
qplot(year, Emissions, data = sources, color = type, 
      geom= "line")+ ggtitle("PM2.5 Emissions in Baltimore County by Source") + 
      xlab("Year") + ylab("PM2.5")     