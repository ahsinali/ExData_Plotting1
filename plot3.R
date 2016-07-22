temp.file <- file("household_power_consumption.txt")
raw.data <- read.table(text = grep("^[1,2]/2/2007", readLines(temp.file), value = TRUE),
                       col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                                     "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
                                     "Sub_metering_3"), sep = ";", header = TRUE,na.strings = "?")
png("plot3.png", width=480, height=480)
time_data <- strptime(paste(raw.data$Date, raw.data$Time), "%d/%m/%Y %H:%M:%S")
time_data <- as.POSIXct(time_data)
plot(time_data, raw.data$Sub_metering_1, 
     type="l", xlab="",  col="black",ylab="Energy sub metering")
lines(time_data, raw.data$Sub_metering_2, col="red")
lines(time_data, raw.data$Sub_metering_3, col="blue")
legend("topright",
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1)

dev.off()