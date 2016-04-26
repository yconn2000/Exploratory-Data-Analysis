## Download file from Coursera

setwd('./R')
url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'
download.file(url, destfile='./raw.zip')
unzip("raw.zip", exdir = ".")


NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS("Source_Classification_Code.rds")

sub1 <- subset(NEI, fips == "24510")
city <- tapply(sub1$Emissions, sub1$year, sum)
plot(city, type = "o", main = "Total PM2.5 Emissions in Baltimore", xlab = "Year", ylab = "PM2.5", 
     pch = 1, col = "blue")