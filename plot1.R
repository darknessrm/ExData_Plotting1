#First Plot

File <- "C:/Users/Usuario/Documents/household_power_consumption.txt"
Data <- read.table(File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSet <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

#We need to put the widtg and height required.
#str(subSet)
globalActivePower <- as.numeric(subSet$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()