
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

#Set parameters such that you have 2 rows and 2 columns for the plots to be plotted on
par(mfrow = c(2,2))

#Plot each plot, will fill according to rows as speified, i.e., first row one, left to right,then row two

plot(datf$Date_time, datf$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(datf$Date_time, datf$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(datf$Date_time, datf$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(datf$Date_time, datf$Sub_metering_2, col = "red")
lines(datf$Date_time, datf$Sub_metering_3, col = "blue")

legend("topright", 
       legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lwd = c(1,1,1), bty = "n")

plot(datf$Date_time, datf$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", yaxt = "n")
axis(2, at= c(0.0, 0.1,0.2,0.3,0.4,0.5), labels = c(0.0, 0.1,0.2,0.3,0.4,0.5))

#ridiculously annoying as the two of the y tickmark labels wouldn't show, the solution is inelegant but the best I could do
axis(2, at = c(0.2,0.4), labels = c(0.2,0.4))

#Copy plot1 to png device, turn off device to make sure it's copied
dev.copy(png, "plot4.png", height = 480, width = 480)

dev.off()

