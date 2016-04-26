## Download file from Coursera

setwd('./R')
url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'
download.file(url, destfile='./raw.zip')
unzip("raw.zip", exdir = ".")
NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS("Source_Classification_Code.rds")


yearly <- with(NEI, aggregate(Emissions, by = list(year), sum))
plot(yearly, type = "o", main = "Total PM2.5 Emissions", xlab = "Year", 
     ylab = "PM2.5", pch = 1, col = "red")


