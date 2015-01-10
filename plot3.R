household_power_consumption <- "household_power_consumption.txt"
a <- file(household_power_consumption)
library(sqldf)
df <- sqldf("select * from a where Date in ('1/2/2007', '2/2/2007')",
              file.format = list(header = TRUE, sep = ";"))
# good practice to close the connection
close(a)

#Plot 3
df$DateTime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "white")
plot(df$DateTime, df$Sub_metering_1, type = "l", xlab = "", 
		ylab = "Energy sub metering")
lines(df$DateTime, df$Sub_metering_2, col="red")
lines(df$DateTime, df$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
		lty = 1, col=c("black", "red", "blue"))
dev.off()