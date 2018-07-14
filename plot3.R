#read data
power <- read.table( "./household_power_consumption.txt",stringsAsFactors = FALSE, header = TRUE, sep =";" )

#subset data from 2007-02-01 and 2007-02-02
subsetdata <- power[power$Date %in% c("1/2/2007","2/2/2007"), ]

#convert data to right class
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subsetdata$Global_active_power <- as.numeric(subsetdata$Global_active_power)
subsetdata$Sub_metering_1<- as.numeric(subsetdata$Sub_metering_1)
subsetdata$Sub_metering_2<- as.numeric(subsetdata$Sub_metering_2)
subsetdata$Sub_metering_3<- as.numeric(subsetdata$Sub_metering_3)

#plot engrgy_sub_metering vs date&time
png("plot3.png", width=480, height=480)
plot(datetime, subsetdata$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subsetdata$Sub_metering_2, type="l", col="red")
lines(datetime, subsetdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
dev.off()
