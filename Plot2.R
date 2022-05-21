## Plot 2

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
library(ggplot2)

total_emissions_per_year <- aggregate(NEI$Emissions, list(NEI$year), sum)
colnames(total_emissions_per_year) <- c("Year", "Total")
total_emissions_per_year

##   Year   Total
## 1 1999 7332967
## 2 2002 5635780
## 3 2005 5454703
## 4 2008 3464206

ggplot(total_emissions_per_year, aes(x=Year,y=Total)) + labs(x="Year", y="Total PM2.5 emission from all sources", title="Total PM2.5 emission from all sources for each year") + geom_bar(width=0.8, stat="identity", fill="#5b23ad")