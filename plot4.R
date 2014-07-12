
#PLOT4.R
#predefined classes for variables
classes <- c("character","character", "numeric","numeric",
             "numeric","numeric","numeric","numeric","numeric")

#load data
data <- read.table("household_power_consumption.txt", sep = ";", header = T, 
                   comment.char = "", colClasses = classes, 
                   na.strings = "?", nrows = 2076000)

#subset data of interest
dataDays <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

#change class of string to date & time
dataDays$Date <- as.Date(dataDays$Date, format = "%d/%m/%Y")

dataDays$Time <- strptime(paste(dataDays$Date,dataDays$Time),
                          format = "%Y-%m-%d %H:%M:%S")

#Plots

width = 480; height = 480

#Plot4

png(file = "./figure/plot04.png", width = width, height = height)

par(mfrow = c(2,2))

#Plot 1.1
with(dataDays, plot(Time, Global_active_power, 
                    xlab = "",
                    ylab = "Global Active Power", 
                    type = "l",
)
)

#Plot 1.2
with(dataDays, plot(Time, Voltage, 
                    xlab = "datetime",
                    ylab = "Voltage", 
                    type = "l",
)
)

#Plot 2.1
with(dataDays, plot(Time, 
                    Sub_metering_1, 
                    xlab = "",
                    ylab = "Energy sub metering", 
                    type = "l"))

with(dataDays, points(Time,
                      Sub_metering_2,
                      xlab = "",
                      col = "red",
                      type = "l"))

with(dataDays, points(Time,
                      Sub_metering_3,
                      xlab = "",
                      col = "blue",
                      type = "l"))

legend("topright", lwd = 2, col = c("black","red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n",
)

#plot 2.2

with(dataDays, plot(Time, Global_reactive_power, 
                    xlab = "datetime",
                    ylab = "Global_reactive_power", 
                    type = "l",
)
)

dev.off()