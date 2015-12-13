# load data
file <- "./household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# choose the data between 2007-02-01 and 2007-02-02
SubSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
str(SubSetData)
# since now the the type of obs in Date is chr,
# we have to change it into Date/Time classes
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# since now the the type of obs in the 6 variables to be used are now chr,
# we have to change it into numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)
# save the plot
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
# draw the 4 plots
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
# add lines for subMetering2 and subMetering3 in the Energy Submetering plot
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
# add the legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
# draw the Global reactive power plot
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()