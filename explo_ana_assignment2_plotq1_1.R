# reading the datadframe
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# writing code and plotting
NEI$year <- factor(NEI$year)
totalemission <- tapply(NEI$Emissions, NEI$year, sum)
png("plotq1.png")
barplot(totalemission, xlab = "Year", ylab = "Total Emission", main = "Toatl Emission per year")
dev.off()
