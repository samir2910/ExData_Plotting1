require(readr)
require(dplyr)

consumption <- read_delim("exdata_data_household_power_consumption.zip",
                          ";", col_types = "ccddddddd")

consumption <- consumption %>%
  filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
  mutate(dateAndTime = as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")))

png("plot1.png", width = 480, height = 480)

hist(consumption$Global_active_power,
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.off()