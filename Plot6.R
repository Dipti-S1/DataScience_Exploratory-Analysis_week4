## Plot 6
## Assuming that summary file is in data folder

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
library(ggplot2)





NEI_vehicle_la <- NEI_vehicle[NEI_vehicle$fips == "06037",]
NEI_vehicle_balt_la <- rbind(NEI_vehicle_balt, NEI_vehicle_la)

cities_names <- c(`06037` = "LA", `24510` = "Baltimore")

ggplot(NEI_vehicle_balt_la, aes(factor(year), Emissions, fill=fips)) + geom_bar(stat="identity") + guides(fill="none") + facet_grid(.~fips, labeller=as_labeller(cities_names)) + labs(x="Year", y="Total Emission", title="Emissions in LA and Baltimore City")