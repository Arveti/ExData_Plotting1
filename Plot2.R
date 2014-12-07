Expasgn1plot2<-function()
{
  data <- read.table("R/household_power_consumption.txt",
                     header = TRUE,sep = ";",
    colClasses = c("character", "character", rep("numeric",7)), na = "?")
  
  subset <- data$Date == "1/2/2007" | data$Date == "2/2/2007"
  
  reqdData <- data[subset, ]
  
  x <- paste(reqdData$Date, reqdData$Time)
  
  reqdData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
  
  png(filename = "plot2.png",width = 480, height = 480, units = "px", bg = "transparent")
  
  plot(reqdData$DateTime,reqdData$Global_active_power,
       type="l",ylab = "Global Active Power (kilowatts)", xlab="Day",ylim = c(0, 8))
  
  dev.off()
  
}