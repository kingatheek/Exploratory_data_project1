## Getting full dataset
power_cons <- read.csv("C:/MOAEK/14_Coursera/Exploratory_data_analysis/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
power_cons$Date <- as.Date(power_cons$Date, format="%d/%m/%Y")

## Data subsetting
subset_power_cons <- subset(power_cons, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(data$Date), data$Time)
subset_power_cons$Datetime <- as.POSIXct(datetime)

## Plot1
hist(subset_power_cons$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", height = 480, width = 480)
dev.off()
