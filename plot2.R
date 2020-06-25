
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
data[, Global_active_power := as.numeric(Global_active_power)]
data[, Date := as.Date(Date, format = "%d/%m/%Y")]

# Filtering dates ---------------------------------------------------------


data <- data[Date >= "2007-02-01" & Date <= "2007-02-02"]


# Creating plot -----------------------------------------------------------

png("ExData_Plotting1/plot2.png", width=480, height=480)


plot(data[, date_time], data[, Global_active_power], type = 'l',
     xlab="", ylab="Global Active Power (kilowatts)")

dev.off()

