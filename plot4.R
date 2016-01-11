plot4 <- function() {
  ##read data and convert columns to numeric,timestamp/dates
  if(!file.exists("household_power_consumption.txt")) {
    File <- paste(getwd(),"/household_power_consumption.txt",sep="")
    powcons <- read.csv(File, header=T, sep=";")
    powcons <- powcons[powcons$Date %in% c("1/2/2007","2/2/2007"),]
  }
  powcons$Date <- as.Date(powcons$Date, format="%d/%m/%Y")
  powcons$Global_active_power <- as.numeric(as.character(powcons$Global_active_power))
  powcons$Voltage <- as.numeric(as.character(powcons$Voltage))
  powcons <- transform(powcons, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  powcons$Sub_metering_1 <- as.numeric(as.character(powcons$Sub_metering_1))
  powcons$Sub_metering_2 <- as.numeric(as.character(powcons$Sub_metering_2))
  powcons$Sub_metering_3 <- as.numeric(as.character(powcons$Sub_metering_3))
  ##Ploting the charts
  png("plot4.png", width=480, height=480)
  par(mfrow = c(2, 2)) 
  ##Quadrant(1,1)
  plot(powcons$timestamp, powcons$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
  ##Quadrant(1,2)
  plot(powcons$timestamp, powcons$Voltage, type="l", xlab="datetime", ylab="Voltage")
  ##Quadrant(2,1)
  plot(powcons$timestamp, powcons$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
  lines(powcons$timestamp, powcons$Sub_metering_2, type="l", col="red")
  lines(powcons$timestamp, powcons$Sub_metering_3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
  ##Quadrant(2,2)
  plot(powcons$timestamp,powcons$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  dev.copy(png, file="plot4.png", width=480, height=480)
  dev.off()
  }
plot4()