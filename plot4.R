#Fourth Plot

File <- "C:/Users/Usuario/Documents/household_power_consumption.txt"
Data <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSet <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

#We need to put the width and height required.
Time <- strptime(paste(subSet$Date, subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSet$Global_active_power)
globalReactivePower <- as.numeric(subSet$Global_reactive_power)
voltage <- as.numeric(subSet$Voltage)
subMetering1 <- as.numeric(subSet$Sub_metering_1)
subMetering2 <- as.numeric(subSet$Sub_metering_2)
subMetering3 <- as.numeric(subSet$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(Time, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(Time, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(Time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(Time, subMetering2, type="l", col="red")
lines(Time, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(Time, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()