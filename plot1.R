library(datasets)
filename <- "household_power_consumption.txt"
Data <- read.table(filename,header = TRUE,na.strings = "?",sep=";")
Global_Active <- subset(Data,Date == "1/2/2007"| Date == "2/2/2007")
hist(Global_Active$Global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)",
     ylab="Frequency")
dev.copy(png,file="plot1.png")
dev.off()
                        