df1 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df2 <- df1
df2$Date <- as.Date(df1$Date, "%d/%m/%Y")
df2$Time <- strptime(df1$Time, "%H:%M:%S")
df3 <- df2[df2$Date == "2007-02-01" | df2$Date == "2007-02-02",]
png(file = "plot1.png")
hist(df3$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

