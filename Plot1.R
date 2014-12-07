Expasgn1plot1<-function()
{
  
  data <- read.table("R/household_power_consumption.txt", header = TRUE, sep = ";",
                     colClasses = c("character", "character", rep("numeric",7)),na = "?")
  subset <- data$Date == "1/2/2007" | data$Date == "2/2/2007"
  
  reqdData <- data[subset, ]
  
  x <- paste(reqdData$Date, reqdData$Time)
  
  reqdData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
  
  png(filename = "plot1.png",width = 480, height = 480,units = "px", bg = "transparent")
  
  
  hist(reqdData$Global_active_power,col = "red",main = "Global Active Power",
       xlab = "Global Active Power (kilowatts)",breaks = 12, ylim = c(0, 1200))
  
  dev.off()
  
}