# plot4.R

data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE,
                   na.strings = "?", stringsAsFactors = FALSE)
data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

data$Global_active_power <- as.numeric(data$Global_active_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# Top-left
plot(data$DateTime, data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power")

# Top-right
plot(data$DateTime, data$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")

# Bottom-left
plot(data$DateTime, data$Sub_metering_1, type = "l", col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1,
       bty = "n")

# Bottom-right
plot(data$DateTime, data$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
