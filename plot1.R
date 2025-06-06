# plot1.R

# Read data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE,
                   na.strings = "?", stringsAsFactors = FALSE)

# Filter dates
data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
data$Global_active_power <- as.numeric(data$Global_active_power)

# Save histogram
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
