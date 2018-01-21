## Plot 4
## Read data table
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   na.strings = "?")
## Convert date variable to date/time classes
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
## Work only on a subset of the data
data_subset <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## Convert time variable to date/time classes
data_subset$datetime <- strptime(paste(data_subset$Date, data_subset$Time), "%Y-%m-%d %H:%M:%S")
data_subset$Global_active_power <- as.numeric(data_subset$Global_active_power)
data_subset$datetime <- as.POSIXct(data_subset$datetime)
## Plot to PNG
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(data_subset$Global_active_power ~ data_subset$datetime, type="l", 
     ylab="Global Active Power", xlab="")

plot(data_subset$Voltage ~ data_subset$datetime, type="l", 
     ylab="Voltage", xlab="datetime")

plot(data_subset$Sub_metering_1 ~ data_subset$datetime, type="l", 
     ylab="Energy sub metering", xlab="")
lines(data_subset$Sub_metering_2 ~ data_subset$datetime, col="Red")
lines(data_subset$Sub_metering_3 ~ data_subset$datetime, col="Blue")
legend("topright", lty=1, bty="n", col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data_subset$Global_reactive_power ~ data_subset$datetime, type="l", 
     ylab="Global_reactive_power", xlab="datetime")

dev.off()