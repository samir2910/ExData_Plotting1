require(readr)
require(dplyr)

consumption <- read_delim("exdata_data_household_power_consumption.zip",
                          ";", col_types = "ccddddddd")

consumption <- consumption %>%
  filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
  mutate(dateAndTime = as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")))

png("plot3.png", width = 480, height = 480)
plot(consumption$dateAndTime,
     consumption$Sub_metering_1,
     type="n",
     xlab = "",
     ylab = "Energy sub metering")

lines(consumption$dateAndTime, consumption$Sub_metering_1, col = "black")
lines(consumption$dateAndTime, consumption$Sub_metering_2, col = "red")
lines(consumption$dateAndTime, consumption$Sub_metering_3, col = "blue")
legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1,
       lwd = 1)

dev.off()