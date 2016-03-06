HPCFile <- "SourceData/household_power_consumption.txt"

HoldData <- read.table(HPCFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

TwoDays <- HoldData[HoldData$Date %in% c("1/2/2007","2/2/2007") ,]


GlobalActivePower <- as.numeric(TwoDays$Global_active_power)
png("Plot1.png", width=480, height=480)
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
