power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")
power$Time<- paste(power$Date, power$Time, sep=";")
power$Date <- as.Date( as.character(power$Date), "%d/%m/%Y")
power$Time <- strptime(as.character(power$Time), "%d/%m/%Y;%H:%M:%S")
x<- 3:9
for(i in x){power[, i] <- as.numeric(power[, i])}
head(power)
power_subsample <- subset(power, power$Date == as.Date("2007-02-01") | power$Date == as.Date("2007-02-02"))
png(filename="plot2.png", height=480, width=480, bg="white")
par("mar"=c(2,4,4,2))
plot(power_subsample$Time, power_subsample$Global_active_power, type="l", ylab= "Global Active Power(kilowatts)")
dev.off()