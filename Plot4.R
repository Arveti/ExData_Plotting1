Expasgn1plot4<-function()
{
  
  data <- read.table("R/household_power_consumption.txt",
   header = TRUE,sep = ";",colClasses = c("character", "character", rep("numeric",7)),na = "?")
  
  subset <- data$Date == "1/2/2007" | data$Date == "2/2/2007"
  
  reqdData <- data[subset, ]
   x <- paste(reqdData$Date, reqdData$Time)
  
  reqdData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
  
  png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "transparent")
  
  par(mfrow=c(2,2))

  plot(reqdData$DateTime,reqdData$Global_active_power,
       type="l",ylab = "Global Active Power (kilowatts)", xlab="Day",ylim = c(0, 8))
  
  plot(reqdData$DateTime,reqdData$Voltage,
       type="l",ylab = "Voltage", xlab="DateTime",ylim = c(232, 250))
  
  plot(reqdData$DateTime, reqdData$Sub_metering_1,
       type = "l",col = "black",xlab = "", ylab = "Energy sub metering")
  
  lines(reqdData$DateTime,reqdData$Sub_metering_2, col = "red")
  lines(reqdData$DateTime,reqdData$Sub_metering_3, col = "blue")
  
  legend("topright",
   col = c("black", "red", "blue"),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2)
  
plot(reqdData$DateTime,reqdData$Global_reactive_power,
     type="l",ylab = "Global_reactive_power", xlab="DateTime")

  dev.off()
  
}