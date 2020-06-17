data <- read.table("./household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na = "?",
                   colClasses = c(rep("character",2),rep("numeric",7)))
head(data)
subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
globalActivePower <- as.numeric(subsetData$Global_active_power)
png("plot1.png",width = 480,height = 480)

hist(globalActivePower,col = "red",xlab = "Global Active Power (kilowatts)"
     ,main = "Global Active Power")
dev.off()
