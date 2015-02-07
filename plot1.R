plot1 <- function(){
  ## This function generates the first plot
  path_to_data <- './data/household_power_consumption.txt'
  raw_data <- read.table(path_to_data, header = TRUE, stringsAsFactors = FALSE,
                         sep = ';', na.strings = '?', colClasses = c(NA, NA, rep('numeric',7)))
  data <- subset(raw_data,Date=="1/2/2007" | raw_data$Date=="2/2/2007")
  rownames(data) <- NULL
  data$Time <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  
  png(file="./ExData_Plotting1/plot1.png", width=480, height=480, bg="transparent")
  with(data, hist(Global_active_power, col="red",
       main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
  dev.off()
}