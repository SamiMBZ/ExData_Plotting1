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

#Combine Date and time into one column and change it to time format

datf <- unite(datf, Date_time, c("Date", "Time"), sep = " ") 
datf$Date_time<- strptime(datf$Date_time, format = "%d/%m/%Y %H:%M:%S")

##Plot plot3 with the appropriate type and axes labels

plot(datf$Date_time, datf$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")

#Overlay the blue and red plot lines
lines(datf$Date_time, datf$Sub_metering_2, col = "red")
lines(datf$Date_time, datf$Sub_metering_3, col = "blue")

#Construct legend with appropriate parameters

legend("topright", 
       legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lwd = c(1,1,1))

#Copy plot3 to png device, turn off device to make sure it's copied

dev.copy( png, "plot3.png", width = 480, height = 480 )
dev.off()
