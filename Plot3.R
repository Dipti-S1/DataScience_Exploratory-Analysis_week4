## Plot 3
## Assuming that summary file is in data folder

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
library(ggplot2)

NEI_Balt <- NEI[NEI$fips=="24510",]
ggplot(NEI_Balt, aes(factor(year), Emissions, fill=type)) + geom_bar(stat="identity") + facet_grid(.~type) + labs(x="Year", y="Total Emission", title="Emissions in Baltimore City")