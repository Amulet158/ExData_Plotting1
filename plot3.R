data <- read.table("./household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na = "?",
                   colClasses = c(rep("character",2),rep("numeric",7)))
head(data)
subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
dateTime <- strptime(paste(subsetData$Date,subsetData$Time,sep=" "),
                     "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subsetData$Global_active_power)

subMetering1 <- as.numeric(subsetData$Sub_metering_1)
subMetering2 <- as.numeric(subsetData$Sub_metering_2)
subMetering3 <- as.numeric(subsetData$Sub_metering_3)

png("plot3.png",height = 480,width = 480)
plot(dateTime,subMetering1,type = 'l',ylab = "Energy Sub metering",
     xlab="")
lines(dateTime,subMetering2,type='l',col="red")
lines(dateTime,subMetering3,type='l',col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1, lwd=2.5,col = c("black","red","blue"))
dev.off()
