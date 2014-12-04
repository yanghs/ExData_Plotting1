power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")
power$Time<- paste(power$Date, power$Time, sep=";")
power$Date <- as.Date( as.character(power$Date), "%d/%m/%Y")
power$Time <- strptime(as.character(power$Time), "%d/%m/%Y;%H:%M:%S")
x<- 3:9
for(i in x){power[, i] <- as.numeric(power[, i])}
head(power)
power_subsample <- subset(power, power$Date == as.Date("2007-02-01") | power$Date == as.Date("2007-02-02"))
png(filename="plot4.png", height=480, width=480, bg="white")
par(mfcol = c(2, 2), mar = c(4, 4, 2, 1))
    plot(power_subsample$Time, power_subsample$Global_active_power, type="l", ylab= "Global Active Power(kilowatts)",xlab="")
    plot(power_subsample$Time, power_subsample$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
    lines(power_subsample$Time, power_subsample$Sub_metering_2, col="red")
    lines(power_subsample$Time, power_subsample$Sub_metering_3, col="blue")
    legend("topright", legend=c("Sub_metering_1","Sub_metering_1","Sub_metering_1"), 
           col=c("black", "red","blue"), lwd=1, lty=c(1, 1, 1), 
           pch=c(NA,NA,NA), merge=FALSE )
    plot(power_subsample$Time, power_subsample$Voltage, type="l", ylab= "Voltage",xlab="datetime")
    plot(power_subsample$Time, power_subsample$Global_reactive_power, type="l", ylab= "Global_reactive_power",xlab="datetime")
dev.off()
