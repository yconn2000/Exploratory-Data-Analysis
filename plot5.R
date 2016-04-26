## Download file from Coursera

setwd('./R')
url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'
download.file(url, destfile='./raw.zip')
unzip("raw.zip", exdir = ".")


NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS("Source_Classification_Code.rds")

sub1 <- subset(NEI, fips == "24510" & type=="ON-ROAD")
baltmore <- aggregate(sub1[c("Emissions")], list(type = sub1$type, year = sub1$year, zip = sub1$fips), sum)
qplot(year, Emissions, data = baltmore, geom= "line") + 
      ggtitle("Motor Vehicle Emissions in Baltimore") + 
      xlab("Year") + ylab("Emission Levels")