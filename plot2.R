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
png("plot2.png",height = 480,width = 480)
plot(dateTime,globalActivePower,type='l',xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
