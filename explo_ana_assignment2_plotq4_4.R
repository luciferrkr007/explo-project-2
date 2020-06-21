# reading the datadframe

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# coding
coalMatches  <- grepl("coal", SCC$Short.Name, ignore.case=TRUE)
subsetSCC <- SCC[coalMatches, ]
NEISCC <- merge(NEI, subsetSCC, by="SCC")
totalEmissions <- tapply(NEISCC$Emissions, NEISCC$year, sum)
#ploting
png("plotq4.png")
barplot(totalEmissions, xlab = "Year", ylab = "Total Emission (ton)", 
        main = "Total Emission from coal sources")
dev.off()