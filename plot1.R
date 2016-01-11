plot1 <- function() {
  ##read data and convert columns to numeric,timestamp/dates
  if(!file.exists("household_power_consumption.txt")) {
    File <- paste(getwd(),"/household_power_consumption.txt",sep="")
  powcons <- read.csv(File, header=T, sep=";")
  powcons <- powcons[powcons$Date %in% c("1/2/2007","2/2/2007"),]
  }
  powcons$Global_active_power <- as.numeric(as.character(powcons$Global_active_power))
  powcons <- transform(powcons, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  ##Ploting the charts
  hist(powcons$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
  dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()
  }
plot1()