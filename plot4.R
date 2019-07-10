power_cons4 <- "C:/MOAEK/14_Coursera/Exploratory_data_analysis/household_power_consumption.txt"
plot4data <- read.table(power_cons4, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
plot4subset <- plot4data[plot4data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(plot4subset$Date, plot4subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(plot4subset$Global_active_power)
globalReactivePower <- as.numeric(plot4subset$Global_reactive_power)
voltage <- as.numeric(plot4subset$Voltage)
subMetering1 <- as.numeric(plot4subset$Sub_metering_1)
subMetering2 <- as.numeric(plot4subset$Sub_metering_2)
subMetering3 <- as.numeric(plot4subset$Sub_metering_3)

#data plotting

png("plot4.png", height = 480, width = 480)
par(mfrow = c(2, 2)) 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
