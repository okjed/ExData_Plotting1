# Set the working directory
setwd("~/Downloads/Coursera/Exploratory Data Analysis/ExData_Plotting1")

# File must be downloaded and unzipped from:
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# This checks whether the file exists already and acquires/unzips if it doesn't exist.
if (!file.exists("household_power_consumption.txt")) {
        zipfileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        zipfilename <- "household_power_consumption.zip"
        download.file(url=zipfileurl,destfile=zipfilename,method="curl")
        unzip(zipfile=zipfilename)
}

#Read in the data file from disk. Examination of the file shows our interested data appears
#in the first 70000 lines, so don't load the entire file
epc <- read.csv("household_power_consumption.txt",sep=";",na.strings="?",comment.char="",nrows=70000)

#Only use the dates required
epc <- epc[epc$Date=="1/2/2007"|epc$Date=="2/2/2007",] 

#Set the graphics device to png with the correct dimension and match example's transparent background
png(filename="plot1.png",width=480,height=480,bg="transparent")

#Plot the histogram
hist(epc$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")

#Close the graphics device
dev.off()

