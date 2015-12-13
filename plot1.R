# load data
file <- "./household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# choose the data between 2007-02-01 and 2007-02-02
SubSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
str(SubSetData)
# since now the the class of obs in Global_active_power is chr,
# we have to change it into numeric
GlobalActivePower <- as.numeric(SubSetData$Global_active_power)
# save the plot with width=480, height=480
png("plot1.png", width=480, height=480)
# draw the plot
hist(SubSetData$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()