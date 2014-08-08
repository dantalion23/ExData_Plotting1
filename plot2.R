# ****************************************
# * Coursera:                            *
# * Exploratory Data Analyis, Project 1. *
# * R script to produce plot2.png        *
# * A. G. Porter                         *
# * Created: 2014-08-08                  *
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

# Convert the Global_active_power column to character then to numeric:
sdf$Global_active_power <- as.numeric(as.character(sdf$Global_active_power))

# Open the png device:
png("plot2.png", width = 480, height = 480)

# Plot the graph:
plot(sdf$Date, sdf$Global_active_power, type = "l", ylab = "Global Active Power (kW)")

# Close the png device:
dev.off()
