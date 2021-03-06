# Exploratory Data Analysis
# Project 1
library(sqldf)
power_consumption <- read.csv.sql("household_power_consumption.txt", 
                                  "select Date, Time, Global_active_power, Global_reactive_power, Voltage, Global_intensity, Sub_metering_1, Sub_metering_2, Sub_metering_3  from file where Date = '1/2/2007' or Date = '2/2/2007'", 
                                  sep=";")
power_consumption$Date <- as.Date(power_consumption$Date, "%d/%m/%y")
png(filename = "plot1.png", 
    width = 480, height = 480, units = "px", 
    bg = "white")
par(mfrow = c(1,1))
hist(power_consumption$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.off()