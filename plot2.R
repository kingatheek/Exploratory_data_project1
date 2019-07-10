power_cons1 <- "C:/MOAEK/14_Coursera/Exploratory_data_analysis/household_power_consumption.txt"
plot2data <- read.table(power_cons1, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subset2data <- plot2data[plot2data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subset2data$Date, subset2data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subset2data$Global_active_power)
png("plot2.png", height = 480, width = 480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
