# plot2.R

data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE,
                   na.strings = "?", stringsAsFactors = FALSE)
data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)

png("plot2.png", width = 480, height = 480)
plot(data$DateTime, data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
