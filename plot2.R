# Plot 2

# Read data
household_power_consumption <- read.csv("~/Coursera Data Science Specialization/household_power_consumption.txt"
                                        , sep=";", na.strings = "?")

# Subset data
data <- household_power_consumption
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- data[which(data$Date == "2007-02-01" | data$Date == "2007-02-02"),]


# Convert to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)
data$gap <- data$Global_active_power


# Convert dates and times
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$datetime <- as.POSIXct(data$datetime)


# Plot
png("plot2.png", width=480, height=480)
plot(data$gap ~ data$datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()

