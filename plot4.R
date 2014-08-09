# ****************************************
# * Coursera:                            *
# * Exploratory Data Analyis, Project 1. *
# * R script to produce plot4.png        *
# * A. G. Porter                         *
# * Created: 2014-08-09                  *
# ****************************************

# Set working directory:
setwd("~/Coursera/Exploratory-Data-Analysis/Projects/ExData_Plotting1")

# Read in the dataframe (df) - csv format, header, separated by ";":
df <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")

# To improve speed of processing subset the dataframe to inlcude only the relevant dates,
# i.e. 2007-02-01 andf 2007-02-02. New dataframe is "sdf":
sdf <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007", ]

# Paste together the Date and Time columns to form a new date column:
sdf$Date <- paste(sdf[, 1], sdf[, 2], sep = " ")

# Convert sdf$Date column to date format:
sdf$Date <- strptime(sdf$Date, format = "%d/%m/%Y %H:%M:%S")

# For plot 1:
# Convert the Global_active_power column to character then to numeric:
sdf$Global_active_power <- as.numeric(as.character(sdf$Global_active_power))

# For plot 2:
# Convert the Voltage column to character then to numeric:
sdf$Voltage <- as.numeric(as.character(sdf$Voltage))

# For plot 3:
# Convert the sub_metering_1, 2 & 3 columns to character then to numeric:
sdf$Sub_metering_1 <- as.numeric(as.character(sdf$Sub_metering_1))
sdf$Sub_metering_2 <- as.numeric(as.character(sdf$Sub_metering_2))
sdf$Sub_metering_3 <- as.numeric(as.character(sdf$Sub_metering_3))

# For plot 4:
# Convert the Global_reactive_power column to character then to numeric:
sdf$Global_reactive_power <- as.numeric(as.character(sdf$Global_reactive_power))

# Open the png device:
png("plot4.png", width = 480, height = 480)

# Plot four panels:
par(mfrow = c(2, 2))

# Plot the graphs:
# Plot 1, top left:
plot(sdf$Date, sdf$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# Plot 2, top right:
plot(sdf$Date, sdf$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Plot 3, bottom left:
plot(sdf$Date, sdf$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(sdf$Date, sdf$Sub_metering_2, type = "l", col = "red")
lines(sdf$Date, sdf$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = c(1, 1, 1), bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot 4, bottom right:
plot(sdf$Date, sdf$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")


# Close the png device:
dev.off()

# Reset mfrow:
par(mfrow = c(1, 1))