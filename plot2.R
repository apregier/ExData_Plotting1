#Time plot of Global Active Power
file <- "household_power_consumption.txt"
data <- read.table(file, sep=";", header=TRUE, na.strings="?")
beginDate <- as.Date("2007-02-01", format="%Y-%m-%d")
endDate <- as.Date("2007-02-02", format="%Y-%m-%d")
data$Time <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- data[data$Date >= beginDate & data$Date <= endDate,]
png("plot2.png", width=480, height=480)
plot(data$Time, data$Global_active_power, ylab="Global Active Power (kilowatts)", type="l", xlab="")
dev.off()
