temp.file <- file("household_power_consumption.txt")
raw.data <- read.table(text = grep("^[1,2]/2/2007", readLines(temp.file), value = TRUE),
                 col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                               "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
                               "Sub_metering_3"), sep = ";", header = TRUE,na.strings = "?")

# Generating Plot 1

png(file = "plot1.png", bg = "white",width=480, height=480)
hist(raw.data$Global_active_power, col = "red", 
     main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")
dev.off()
