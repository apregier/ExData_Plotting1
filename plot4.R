#4 plots: Global active power over time, voltage over time, energy submetering, and global reactive power over time
file <- "household_power_consumption.txt"
data <- read.table(file, sep=";", header=TRUE, na.strings="?")
beginDate <- as.Date("2007-02-01", format="%Y-%m-%d")
endDate <- as.Date("2007-02-02", format="%Y-%m-%d")
data$Time <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- data[data$Date >= beginDate & data$Date <= endDate,]
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(data$Time, data$Global_active_power, ylab="Global Active Power (kilowatts)", type="l", xlab="")
plot(data$Time, data$Voltage, ylab="Voltage", type="l", xlab="datetime")
plot(data$Time, data$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l", col="black")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1))
plot(data$Time, data$Global_reactive_power, ylab="Global_reactive_power", type="l", xlab="datetime")
dev.off()
