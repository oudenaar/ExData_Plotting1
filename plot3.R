# Reading data from file
pp <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE, colClasses = c("character", "character", "numeric", "numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")

# Fix First column Data field into real Dates
pp$Date <- as.Date(pp$Date , "%d/%m/%Y")

# Only use Dates between 2007-02-01 and 2007-02-02
pp1 <- subset(pp, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Plot to PNG
png(width = 480, height = 480, units = "px", file = "plot3.png")
with(pp1, { 
        plot(ylab="Global Active Power (kilowatts)", xaxt = "n", type="n")
        lines(Sub_metering_2, type="l", ylab="Global Active Power (kilowatts)", col="black")
        lines(Sub_metering_2, type="l", ylab="Global Active Power (kilowatts)", col="blue")
        lines(Sub_metering_3, type="l", ylab="Global Active Power (kilowatts)", col="red")
})

dev.off()