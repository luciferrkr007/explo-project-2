# reading the datadframe
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#code
NEIF <- subset(NEI, fips == "24510")
data <- aggregate(Emissions~year + type,NEIF, sum)
#plotting
png("plotq3.png")
g <- ggplot(data, aes(year, Emissions, color = type))
g + geom_line() + xlab("Year") + ylab(expression("Total PM"[2.5]*" Emissions")) +ggtitle("Total Emissions per type in Baltimore")
dev.off()