# reading the datadframe
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# code 
NEIF <- subset(NEI, fips == "24510")
totalemission <- tapply(NEIF$Emission, NEIF$year, sum)
#ploting
png("plotq2.png")
barplot(totalemission, xlab = "year",ylab = "Total Emission", main = "Total Emission per year in Baltimore")
dev.off()