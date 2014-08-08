# ****************************************
# * Coursera:                            *
# * Exploratory Data Analyis, Project 1. *
# * R script to produce plot1.png        *
# * A. G. Porter                         *
# * Created: 2014-08-07                  *
# ****************************************

# Set working directory:
setwd("~/Coursera/Exploratory-Data-Analysis/Projects/ExData_Plotting1")

# Read in the dataframe (df) - csv format, header, separated by ";":
df <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")

# Convert df$Date column to date format:
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

# To improve speed of processing subset the dataframe to inlcude only the relevant dates,
# i.e. 2007-02-01 andf 2007-02-02. New dataframe is "sdf":
sdf <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02", ]

# Convert the Global_active_power column to character then to numeric:
sdf$Global_active_power <- as.numeric(as.character(sdf$Global_active_power))

# Open the png device:
png("plot1.png", width = 480, height = 480)

# Plot the graph:
hist(sdf$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kW)", col = "red")

# Close the png device:
dev.off()
