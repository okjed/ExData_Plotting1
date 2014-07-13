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

#Combine the date and time to create the appropriate form for the date/time analysis
epc$datetime <- with(epc,strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"))

#Set the graphics device to png with the correct dimension and match example's transparent background
png(filename="plot2.png",width=480,height=480,bg="transparent")

#Plot Global Active Power vs DateTime with a line
with(epc,plot(datetime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=NA))

#Close the graphics device
dev.off()
