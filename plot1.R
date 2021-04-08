
#Source the data; Unzip data

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./rawdata.zip")
unzip("rawdata.zip", exdir = "./Rawdatafolder")

#Read relevant section of data to table, I examined the text file to find out which rows to include + for colnames
data<- read.table("./Rawdatafolder/household_power_consumption.txt", header = FALSE, skip = 66637, nrows = 2880, sep = ";", 
                  col.names = c("Date", "Time","Global_active_power","Global_reactive_power",
                                "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
                  na.strings = "?")

#I always like to inspect my data to make sure everything is as it should be
head(data)
tail(data)

str(data)


#plot the first histogram, use base R 

hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

#Copy plot1 to png device, turn off device to make sure it's copied
dev.copy(png, "plot1.png")
dev.off()

#Viola! 
  