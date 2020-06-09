library("data.table")


#Reads in data from file then subsets data for specified dates
power_data <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

power_data[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates for 2007-02-01 and 2007-02-02
power_data <- power_data[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot3.png", width=480, height=480)

# Plot 3
plot(power_data[, dateTime], power_data[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(power_data[, dateTime], power_data[, Sub_metering_2],col="red")
lines(power_data[, dateTime], power_data[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()
