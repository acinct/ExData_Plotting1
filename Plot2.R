HPCFile <- "SourceData/household_power_consumption.txt"

HoldData <- read.table(HPCFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

TwoDays <- HoldData[HoldData$Date %in% c("1/2/2007","2/2/2007") ,]

DateFormat <- strptime(paste(TwoDays$Date, TwoDays$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(TwoDays$Global_active_power)
png("Plot2.png", width=480, height=480)
plot(DateFormat, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
