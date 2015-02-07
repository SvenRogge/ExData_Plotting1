plot4 <- function(){
  ## This function generates the fourth plot
  path_to_data <- './data/household_power_consumption.txt'
  raw_data <- read.table(path_to_data, header = TRUE, stringsAsFactors = FALSE,
                         sep = ';', na.strings = '?', colClasses = c(NA, NA, rep('numeric',7)))
  data <- subset(raw_data,Date=="1/2/2007" | raw_data$Date=="2/2/2007")
  rownames(data) <- NULL
  data$Time <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  
  Sys.setlocale("LC_TIME", "C")
  png(file="./ExData_Plotting1/plot4.png", width=480, height=480, bg="transparent")
  par(mfrow = c(2,2))
  with(data, {
    plot(Time,Global_active_power, "l", ylab = "Global Active Power", xlab="")
    
    plot(Time,Voltage, "l", xlab="datetime")
    
    plot(Time, Sub_metering_1, "l", col="black", ylab = "Energy sub metering", xlab="")
    lines(Time, Sub_metering_2, "l", col="red")
    lines(Time, Sub_metering_3, "l", col="blue")
    legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1, bty="n")
    
    plot(Time,Global_reactive_power, "l", xlab="datetime")
  })
  
  dev.off()
}