#read data
power <- read.table( "./household_power_consumption.txt",stringsAsFactors = FALSE, header = TRUE, sep =";" )

#subset data from 2007-02-01 and 2007-02-02
subsetdata <- power[power$Date %in% c("1/2/2007","2/2/2007"), ]

#plot globalactivepower vs date&time
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subsetdata$Global_active_power <- as.numeric(subsetdata$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, subsetdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
