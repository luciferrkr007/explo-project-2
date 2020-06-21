# reading the datadframe
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#coding
vehicleMatches  <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
subsetSCC <- SCC[vehicleMatches, ]
NEISCC <- merge(balt, subsetSCC, by="SCC")
totalEmissions <- tapply(NEISCC$Emissions, NEISCC$year, sum)

# plotting
png("plotq5.png")
barplot(totalEmissions, xlab = "Year", ylab = "Total Emission (ton)", 
        main = "Total Emission from motor sources in Baltimore")
dev.off()