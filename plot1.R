
# Packages ----------------------------------------------------------------

library(data.table)


# Read data ---------------------------------------------------------------

data <- fread('C:/Users/caetano/Downloads/exdata_data_household_power_consumption/household_power_consumption.txt')


# First rows --------------------------------------------------------------

head(data)


# Class -------------------------------------------------------------------

sapply(data, class)


# Change class ------------------------------------------------------------

data[, Date := as.Date(Date, format = "%d/%m/%Y")]
data[, Global_active_power := as.numeric(Global_active_power)]

# Filtering dates ---------------------------------------------------------


data <- data[Date >= "2007-02-01" & Date <= "2007-02-02"]


# Creating plot -----------------------------------------------------------

png("ExData_Plotting1/plot1.png", width=480, height=480)

hist(data[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()

