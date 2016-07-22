temp.file <- file("household_power_consumption.txt")
raw.data <- read.table(text = grep("^[1,2]/2/2007", readLines(temp.file), value = TRUE),
                       col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                                     "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
                                     "Sub_metering_3"), sep = ";", header = TRUE,na.strings = "?")
png(file = "plot2.png", bg = "white",width=480, height=480)

time_data <- strptime(paste(raw.data$Date, raw.data$Time), "%d/%m/%Y %H:%M:%S")
time_data <- as.POSIXct(time_data)
plot(raw.data$Global_active_power ~ time_data, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
