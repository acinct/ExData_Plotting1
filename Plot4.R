HPCFile <- "SourceData/household_power_consumption.txt"

HoldData <- read.table(HPCFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

TwoDays <- HoldData[HoldData$Date %in% c("1/2/2007","2/2/2007") ,]

DateFormat <- strptime(paste(TwoDays$Date, TwoDays$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(TwoDays$Global_active_power)
GlobalReactivePower <- as.numeric(TwoDays$Global_reactive_power)
Voltage <- as.numeric(TwoDays$Voltage)

SubMeter1 <- as.numeric(TwoDays$Sub_metering_1)
SubMeter2 <- as.numeric(TwoDays$Sub_metering_2)
SubMeter3 <- as.numeric(TwoDays$Sub_metering_3)

png("Plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(DateFormat, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(DateFormat, Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(DateFormat, SubMeter1, type="l", ylab="Energy SubMetering", xlab="")
lines(DateFormat, SubMeter2, type="l", col="red")
lines(C, SubMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(DateFormat, GlobalReactivePower, type="l", xlab="datetime", ylab="Global Reactive Power")

dev.off()
