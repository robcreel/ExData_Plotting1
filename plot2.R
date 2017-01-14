df1 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df2 <- df1
df2$date_time <- as.POSIXct(paste(df1$Date, df1$Time), format = "%d/%m/%Y %H:%M:%S")
df2$Date <- as.Date(df1$Date, "%d/%m/%Y")
df2$Time <- strptime(df1$Time, "%H:%M:%S")
df3 <- df2[df2$Date == "2007-02-01" | df2$Date == "2007-02-02",]
png(file = "plot2.png")
plot(df3$date_time, df3$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", pch = ".")
lines(df3$date_time, df3$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

