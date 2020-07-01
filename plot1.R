# Checking if the directory exists or not and creating it if
# it doesn't exists. Once it has been created download the zip
# file and extracting the data

setwd("C:/Users/DELL/OneDrive/Desktop/Coursera Folder")

if(!file.exists("./Exploratory Data Analysis Project-1")){
  dir.create("./Exploratory Data Analysis Project-1")
}

datafile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(datafile, 
destfile = "./Exploratory Data Analysis Project-1/exdata_data_household_power_consumption.zip")

unzip(zipfile = "./Exploratory Data Analysis Project-1/exdata_data_household_power_consumption.zip", 
exdir = "./Exploratory Data Analysis Project-1/exdata_data_household_power_consumption")

# Reading the text file

powerCondata <- read.csv("./Exploratory Data Analysis Project-1/exdata_data_household_power_consumption/household_power_consumption.txt",
                         sep = ";",
                         na.strings = "?" )

subsetPowerData <-  subset(powerCondata, powerCondata$Date == "1/2/2007" | powerCondata$Date =="2/2/2007")

hist(subsetPowerData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

png("plot1.png", width = 480, height = 480)
