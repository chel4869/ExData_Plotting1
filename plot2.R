# load data
file <- "./household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# choose the data between 2007-02-01 and 2007-02-02
SubSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
str(SubSetData)
# since now the the type of obs in Date is chr,
# we have to change it into Date/Time classes
datetime <- strptime(paste(SubSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# since now the the type of obs in Global_active_power is chr,
# we have to change it into numeric
GlobalActivePower <- as.numeric(subSetData$Global_active_power)
# save the plot
png("plot2.png", width=480, height=480)
# draw the plot
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()