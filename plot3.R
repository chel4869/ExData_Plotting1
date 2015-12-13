# load data
file <- "./household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# choose the data between 2007-02-01 and 2007-02-02
SubSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
str(SubSetData)
# since now the the type of obs in Date is chr,
# we have to change it into Date/Time classes
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# since now the the type of obs in the 4 variables to be used are now chr,
# we have to change it into numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)
# save the plot
png("plot3.png", width=480, height=480)
# draw the plot first with an x-axis of subMetering1
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
# then add the other two lines
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
# add the legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()