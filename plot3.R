plot3 <- function() {
  ##read data and convert columns to numeric,timestamp/dates
  if(!file.exists("household_power_consumption.txt")) {
    File <- paste(getwd(),"/household_power_consumption.txt",sep="")
    powcons <- read.csv(File, header=T, sep=";")
    powcons <- powcons[powcons$Date %in% c("1/2/2007","2/2/2007"),]
  }
  powcons$Date <- as.Date(powcons$Date, format="%d/%m/%Y")
  powcons <- transform(powcons, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  powcons$Sub_metering_1 <- as.numeric(as.character(powcons$Sub_metering_1))
  powcons$Sub_metering_2 <- as.numeric(as.character(powcons$Sub_metering_2))
  powcons$Sub_metering_3 <- as.numeric(as.character(powcons$Sub_metering_3))
  ##Ploting the charts
  png("plot3.png", width=480, height=480)
  plot(powcons$timestamp,powcons$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(powcons$timestamp,powcons$Sub_metering_2,col="red")
  lines(powcons$timestamp,powcons$Sub_metering_3,col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
  dev.copy(png, file="plot3.png", width=480, height=480)
  dev.off()
 }
plot3()