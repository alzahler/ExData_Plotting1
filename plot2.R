
#PLOT2.R
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

#Plot #2

png(file = "./figure/plot02.png", width = width, height = height)

plot(dataDays$Time,
     dataDays$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
)

dev.off()