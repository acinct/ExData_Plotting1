HPCFile <- "SourceData/household_power_consumption.txt"

HoldData <- read.table(HPCFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

TwoDays <- HoldData[HoldData$Date %in% c("1/2/2007","2/2/2007") ,]


DateFormat <- strptime(paste(TwoDays$Date, TwoDays$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

SubMeter1 <- as.numeric(TwoDays$Sub_metering_1)
SubMeter2 <- as.numeric(TwoDays$Sub_metering_2)
SubMeter3 <- as.numeric(TwoDays$Sub_metering_3)

png("Plot3.png", width=480, height=480)
plot(DateFormat, SubMeter1, type="l", ylab="Energy SubMetering", xlab="")
lines(DateFormat, SubMeter2, type="l", col="red")
lines(DateFormat, SubMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
