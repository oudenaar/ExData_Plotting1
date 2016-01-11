# Reading data from file
pp <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE, colClasses = c("character", "character", "numeric", "numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")

# Add DateTime Obj to table
pp$DateTime<- paste(pp$Date, pp$Time)
pp$DateTimeObj<-strptime(pp$DateTime,"%d/%m/%Y %H:%M:%S" )
# Fix First column Data field into real Dates
pp$Date<-as.Date(pp$Date , "%d/%m/%Y")

# Only use Dates between 2007-02-01 and 2007-02-02
pp1 <- subset(pp, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Plot to PNG
png(width = 480, height = 480, units = "px", file = "plot3.png")
plot(pp1$DateTimeObj,pp1$Sub_metering_1, type="l", xlab="Dates", ylab="Global Active Power (kilowatts)")
lines(pp1$DateTimeObj,pp1$Sub_metering_2, type="l", col="red")
lines(pp1$DateTimeObj,pp1$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black","red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), pch="-", cex=1)
dev.off()