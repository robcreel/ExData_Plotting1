df1 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df2 <- df1
df2$date_time <- as.POSIXct(paste(df1$Date, df1$Time), format = "%d/%m/%Y %H:%M:%S")
df2$Date <- as.Date(df1$Date, "%d/%m/%Y")
df2$Time <- strptime(df1$Time, "%H:%M:%S")
df3 <- df2[df2$Date == "2007-02-01" | df2$Date == "2007-02-02",]
png(file = "plot4.png")
par(mfcol = c(2, 2))
plot(df3$date_time, df3$Global_active_power, xlab = "", ylab = "Global Active Power", pch = ".")
lines(df3$date_time, df3$Global_active_power, xlab = "", ylab = "Global Active Power")
#
plot(df3$date_time, df3$Sub_metering_1, pch = ".", xlab = "", ylab = "Energy sub metering")
lines(df3$date_time, df3$Sub_metering_1, pch = ".")
lines(df3$date_time, df3$Sub_metering_2, pch = ".", col = "red")
lines(df3$date_time, df3$Sub_metering_3, pch = ".", col = "blue")
legend("topright", legend = names(df3)[7:9], col = c("black", "blue", "red"), lty = 1, bty = "n")
#
plot(df3$date_time, df3$Voltage, pch = ".", xlab = "datetime", ylab = "Voltage")
lines(df3$date_time, df3$Voltage, pch = ".", xlab = "datetime", ylab = "Voltage")
#
plot(df3$date_time, df3$Global_reactive_power, pch = ".", xlab = "datetime", ylab = "Global_reactive_power")
lines(df3$date_time, df3$Global_reactive_power, pch = ".", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()