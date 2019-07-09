# Plot 4

# Read data
household_power_consumption <- read.csv("~/Coursera Data Science Specialization/household_power_consumption.txt"
                                        , sep=";", na.strings = "?")

# Subset data
data <- household_power_consumption
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- data[which(data$Date == "2007-02-01" | data$Date == "2007-02-02"),]


# Convert to numeric
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$gap <- data$Global_active_power


# Convert dates and times
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$datetime <- as.POSIXct(data$datetime)


# Plot
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

##1
plot(data$gap ~ data$datetime, type = "l",
     ylab = "Global Active Power", xlab = "")
##2
plot(data$Voltage ~ data$datetime, type = "l", 
     ylab = "Voltage", xlab = "datetime")
##3
plot(data$Sub_metering_1 ~ data$datetime, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(data$Sub_metering_2 ~ data$datetime, col = "Red")
lines(data$Sub_metering_3 ~ data$datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
##4
plot(data$Global_reactive_power ~ data$datetime, type = "l", 
     ylab = "Global_reactive_power", xlab = "datetime")

dev.off()
