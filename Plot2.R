## Plot 2
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
png("plot2.png", width=480, height=480)
plot(data_subset$Global_active_power ~ data_subset$datetime, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()