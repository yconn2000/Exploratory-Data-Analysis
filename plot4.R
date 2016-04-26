## Download file from Coursera

setwd('./R')
url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'
download.file(url, destfile='./raw.zip')
unzip("raw.zip", exdir = ".")


NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS("Source_Classification_Code.rds")


SCCcoal <- SCC[grepl("Coal" , SCC$Short.Name), ]
NEIcoal <- NEI[NEI$SCC %in% SCCcoal$SCC, ]
sub1 <- with(NEIcoal, aggregate(Emissions, by = list(year), sum))

plot(sub1, type = "o", main = "Coal Emissions in US", xlab = "Year", ylab = "PM2.5", 
     pch = 1, col = "blue")