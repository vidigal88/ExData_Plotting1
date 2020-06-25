
# Packages ----------------------------------------------------------------

library(data.table)


# Read data ---------------------------------------------------------------

data <- fread('C:/Users/caetano/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt')


# First rows --------------------------------------------------------------

head(data)


# Class -------------------------------------------------------------------

sapply(data, class)


# Change class ------------------------------------------------------------

data[, date_time := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
data[, Sub_metering_1 := as.numeric(Sub_metering_1)]
data[, Sub_metering_2 := as.numeric(Sub_metering_2)]
data[, Sub_metering_3 := as.numeric(Sub_metering_3)]

data[, Date := as.Date(Date, format = "%d/%m/%Y")]

# Filtering dates ---------------------------------------------------------


data <- data[Date >= "2007-02-01" & Date <= "2007-02-02"]


# Creating plot -----------------------------------------------------------

png("ExData_Plotting1/plot3.png", width=480, height=480)


plot(data[, date_time], data[, Sub_metering_1], type = 'l',
     xlab="", ylab="Energy sub metering")
lines(data[, date_time], data[, Sub_metering_2], col = 'red')
lines(data[, date_time], data[, Sub_metering_3], col = 'blue')
legend('topright', 
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col = c("black", "red", "blue"), lty = 1)

dev.off()

