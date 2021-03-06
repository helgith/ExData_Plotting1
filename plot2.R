# Exploratory Data Analysis
# Project 1
library(sqldf)
power_consumption <- read.csv.sql("household_power_consumption.txt", 
                                  "select Date, Time, Global_active_power, Global_reactive_power, Voltage, Global_intensity, Sub_metering_1, Sub_metering_2, Sub_metering_3  from file where Date = '1/2/2007' or Date = '2/2/2007'", 
                                  sep=";")
power_consumption$DateTime <- strptime(paste(power_consumption$Date, power_consumption$Time),
                                       format = "%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png", 
    width = 480, height = 480, units = "px", 
    bg = "white")
par(mfrow = c(1,1))
plot(power_consumption$DateTime, power_consumption$Global_active_power,
     ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
dev.off()