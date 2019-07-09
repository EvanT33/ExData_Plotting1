# Plot 1

# Read data
household_power_consumption <- read.csv("~/Coursera Data Science Specialization/household_power_consumption.txt"
                                        , sep=";", na.strings = "?")

# Subset data
data <- household_power_consumption
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- data[which(data$Date == "2007-02-01" | data$Date == "2007-02-02"),]


# Convert to KW (although ReadMe indicates it's already in KW, chart we are asked to recreate
# indicates otherwise...)
data$Global_active_power <- as.numeric(data$Global_active_power)
data$gap <- data$Global_active_power


# Plot
png("plot1.png", width=480, height=480)
hist(data$gap, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()
