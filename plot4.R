# Reading data from file
pp <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE, colClasses = c("character", "character", "numeric", "numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")

# Fix First column Data field into real Dates
pp$Date <- as.Date(pp$Date , "%d/%m/%Y")

# Only use Dates between 2007-02-01 and 2007-02-02
pp1 <- subset(pp, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Plot to PNG
png(width = 480, height = 480, units = "px", file = "plot4.png")

par(mfrow=c(2,2))

plot(pp1$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xaxt = "n")

plot(pp1$Voltage, type="l", xlab="DateTime", ylab="Voltage", xaxt = "n")

plot(pp1$Sub_metering_1, type="l", xlab="Dates", ylab="Global Active Power (kilowatts)", xaxt = "n")
lines(pp1$Sub_metering_2, type="l",  xaxt = "n", col="red")
lines(pp1$Sub_metering_3, type="l", xaxt = "n", col="blue")
legend("topright", col=c("black","red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), pch="-", cex=1)

plot(pp1$Global_reactive_power, type="l", xlab="DateTime", ylab="Global Reactive Power (kilowatts)", xaxt = "n")

dev.off()