power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")
power$Time<- paste(power$Date, power$Time, sep=";")
power$Date <- as.Date( as.character(power$Date), "%d/%m/%Y")
power$Time <- strptime(as.character(power$Time), "%d/%m/%Y;%H:%M:%S")
x<- 3:9
for(i in x){power[, i] <- as.numeric(power[, i])}
head(power)
power_subsample <- subset(power, power$Date == as.Date("2007-02-01") | power$Date == as.Date("2007-02-02"))
png(filename="plot1.png", height=480, width=480, bg="white")
hist(power_subsample$Global_active_power, col="red", main= "Global Active Power", xlab= "Global Active Power(kilowatts)", ylim=c(0,1200))
dev.off()

