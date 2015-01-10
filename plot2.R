household_power_consumption <- "household_power_consumption.txt"
a <- file(household_power_consumption)
library(sqldf)
df <- sqldf("select * from a where Date in ('1/2/2007', '2/2/2007')",
              file.format = list(header = TRUE, sep = ";"))
# good practice to close the connection
close(a)

#Plot 2
df$DateTime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "white")
plot(df$DateTime, df$Global_active_power, type = "l", xlab = "", 
		ylab = "Global Active Power (kilowatts)")
dev.off()