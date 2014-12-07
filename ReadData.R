ReadData<-function()
{
  data <- read.table("R/household_power_consumption.txt", header = TRUE, sep = ";",
                     colClasses = c("character", "character", rep("numeric",7)),na = "?")
  subset <- data$Date == "1/2/2007" | data$Date == "2/2/2007"
  
  reqdData <- data[subset, ]
  
  x <- paste(reqdData$Date, reqdData$Time)
  
  reqdData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
  
}