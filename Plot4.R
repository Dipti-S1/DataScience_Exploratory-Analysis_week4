## Plot 4
## Assuming that summary file is in data folder

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
library(ggplot2)

##        fips      SCC Pollutant Emissions  type year
## 9979  09011 10100217  PM25-PRI   479.907 POINT 1999
## 19504 23005 10200202  PM25-PRI     0.119 POINT 1999
## 22888 23009 10200219  PM25-PRI     3.419 POINT 1999
## 28873 23017 10200219  PM25-PRI    11.242 POINT 1999
## 44907 25005 10100202  PM25-PRI  1012.027 POINT 1999
## 44911 25005 10100212  PM25-PRI  1050.520 POINT 1999


combustion <- grepl("comb",  SCC$SCC.Level.One, ignore.case=TRUE)
coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
SCC_coal_combustion <- SCC[(combustion & coal),]$SCC
NEI_coal_combustion <- NEI[NEI$SCC %in% SCC_coal_combustion,]
head(NEI_coal_combustion)

ggplot(NEI_coal_combustion, aes(factor(year), Emissions)) + geom_bar(stat="identity", fill="#5b23ad") + labs(x="Year", y="Total emission", title="Coal combustion-related sources emission")