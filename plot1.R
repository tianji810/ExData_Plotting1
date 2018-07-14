#read data
power <- read.table( "./household_power_consumption.txt",stringsAsFactors = FALSE, header = TRUE, sep =";" )

#subset data from 2007-02-01 and 2007-02-02
subsetdata <- power[power$Date %in% c("1/2/2007","2/2/2007"), ]

#plot histogram of global active power
subsetdata$Global_active_power <- as.numeric(subsetdata$Global_active_power)
png("plot1.png", width=480, height=480)
hist(subsetdata$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()
