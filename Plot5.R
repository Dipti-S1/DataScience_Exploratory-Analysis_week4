## Plot 5
## Assuming that summary file is in data folder

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
library(ggplot2)


##         fips        SCC Pollutant Emissions    type year
## 114470 24510 220100123B  PM25-PRI      7.38 ON-ROAD 1999
## 114472 24510 220100123T  PM25-PRI      2.78 ON-ROAD 1999
## 114477 24510 220100123X  PM25-PRI     11.76 ON-ROAD 1999
## 114479 24510 220100125B  PM25-PRI      3.50 ON-ROAD 1999
## 114481 24510 220100125T  PM25-PRI      1.32 ON-ROAD 1999
## 114486 24510 220100125X  PM25-PRI      5.58 ON-ROAD 1999

vehicle <- grepl("vehicle",  SCC$SCC.Level.Two, ignore.case=TRUE)
SCC_vehicle <- SCC[vehicle,]$SCC
NEI_vehicle <- NEI[NEI$SCC %in% SCC_vehicle,]
NEI_vehicle_balt <- NEI_vehicle[NEI_vehicle$fips == 24510,]
head(NEI_vehicle_balt)

ggplot(NEI_vehicle_balt, aes(factor(year), Emissions)) + geom_bar(stat="identity", fill="#5b23ad") + labs(x="Year", y="Total emission", title="Motor vehicle sources emission in Baltimore")