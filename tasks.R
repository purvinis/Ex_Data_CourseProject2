#The overall goal of this assignment is to explore the National Emissions 
#Inventory database and see what it say about fine particulate matter 
#pollution in the United states over the 10-year period 1999–2008.

#Read the data into R:
# NEI: National Emmissions Inventory  (the data for years 1999,2002,2005,2008)
# SCC: Source Classification Code

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Q1. 
# Have total emissions from PM2.5 decreased in the United States from 
# 1999 to 2008? Using the base plotting system, make a plot showing the 
# total PM2.5 emission from all sources for each of the years
# 1999, 2002, 2005, and 2008.

emmissionTot <-NEI$Emissions
print(mean(is.na(emmissionTot)))   #make sure there are no NAs
emByYr <- sapply(split(emmissionTot,NEI$year), sum)
years <- unique(NEI$year)

png(filename = "plot1.png")

bp <- barplot(emByYr, col = rgb( .5,0,.5,.2),
     xlab = "Year",
     ylab = "tons",
     main = "Total PM2.5 emission in the U.S. \n from all sources by year",
     sub = "Bar plot showing total PM2.5 decreased from 1999 to 2008.")
text(bp,emByYr*0.9,labels = round(emByYr,digits = 0))

dev.off()


