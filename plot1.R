household_power_consumption <- "household_power_consumption.txt"
a <- file(household_power_consumption)
library(sqldf)
df <- sqldf("select * from a where Date in ('1/2/2007', '2/2/2007')",
              file.format = list(header = TRUE, sep = ";"))
# good practice to close the connection
close(a)

#Plot 1
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "white")
hist(df$Global_active_power, col = "red", main = "Global Active Power", 
		xlab = "Global Active Power (kilowatts)")
dev.off()