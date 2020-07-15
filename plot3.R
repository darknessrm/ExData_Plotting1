#Third Plot

File <- "C:/Users/Usuario/Documents/household_power_consumption.txt"
Data <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSet <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

#We need to put the width and height required.
Time <- strptime(paste(subSet$Date, subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSet$Global_active_power)
subMetering1 <- as.numeric(subSet$Sub_metering_1)
subMetering2 <- as.numeric(subSet$Sub_metering_2)
subMetering3 <- as.numeric(subSet$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(Time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(Time, subMetering2, type="l", col="red")
lines(Time, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()