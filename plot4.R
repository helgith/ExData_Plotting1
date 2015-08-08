# Exploratory Data Analysis
# Project 1
Sys.setenv(LANG = "en_US.UTF-8")
library(sqldf)
library(zoo)
power_consumption <- read.csv.sql("household_power_consumption.txt", 
                                  "select Date, Time, Global_active_power, Global_reactive_power, Voltage, Global_intensity, Sub_metering_1, Sub_metering_2, Sub_metering_3  from file where Date = '1/2/2007' or Date = '2/2/2007'", 
                                  sep=";")
power_consumption$DateTime <- strptime(paste(power_consumption$Date, power_consumption$Time),
                                       format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "white")

par(mfrow = c(2,2), mar = c(4, 4, 2, 2))
# Plot 1: Global Active Power is top left corner
series_global_active_power <- zoo(power_consumption$Global_active_power, power_consumption$DateTime)
plot(series_global_active_power, ylab = "Global Active Power", xlab = "", type = "l")

# Plot Voltage is top right corner
series_voltage <- zoo(power_consumption$Voltage, power_consumption$DateTime)
plot(series_voltage, ylab = "Voltage", xlab = "datetime", type = "l")

# Plot Energy sub metering in buttom left corner
series_sub_metering_1 <- zoo(power_consumption$Sub_metering_1, power_consumption$DateTime)
plot(series_sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
points(power_consumption$DateTime, power_consumption$Sub_metering_2, col="red", type = "l")
points(power_consumption$DateTime, power_consumption$Sub_metering_3, col="blue", type = "l")
legend("topright", bty = "n", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot Global reactive power in buttom right corner
series_global_reactive_power <- zoo(power_consumption$Global_reactive_power, power_consumption$DateTime)
plot(series_global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l")

# Close device
dev.off()