#Second Plot

File <- "C:/Users/Usuario/Documents/household_power_consumption.txt"
Data <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSet <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

#We need to put the width and height required.
#str(subSet)
Time <- strptime(paste(subSet$Date, subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSet$Global_active_power)
png("plot2.png", width=480, height=480)
plot(Time, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()