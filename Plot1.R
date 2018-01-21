## Plot 1
## Read data table
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   na.strings = "?")
## Convert date variable to date/time classes
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
## Work only on a subset of the data
data_subset <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
data_subset$Global_active_power <- as.numeric(data_subset$Global_active_power)
## Plot to PNG
png("plot1.png", width=480, height=480)
hist(data_subset$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()