library(datasets)
library(lubridate)
filename <- "household_power_consumption.txt"
Data <- read.table(filename,header = TRUE,na.strings = "?",sep=";")
Global_Active <- subset(Data,Date == "1/2/2007"| Date == "2/2/2007")
Glo_time <- paste(Global_Active$Date,Global_Active$Time)
Day_time <- dmy_hms(Glo_time)
Global_Active <- cbind(Global_Active,Day_time)
plot(Global_Active$Sub_metering_1 ~ Global_Active$Day_time,type="l",
     ylab="Energy sub metering",ylim=c(0,max(Global_Active$Sub_metering_1,Global_Active$Sub_metering_2,Global_Active$Sub_metering_3)))
lines(Global_Active$Sub_metering_2~Global_Active$Day_time,type="l",col="red")
lines(Global_Active$Sub_metering_3~Global_Active$Day_time,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=2,
       col=c("black","red","blue"))
dev.copy(png,file="plot3.png")
dev.off()
