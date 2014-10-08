#This script read the file household_power_consumption.txt and creates
#a plot for Energy sub metering VS time for all the 3 possibilities.

plot3 <- function() {
    
    library(data.table)
    
    #read the file
    DT <- fread("household_power_consumption.txt")
    
    #subset the file to select the days 01/02/2007 and 02/02/2007
    c1<-as.numeric(as.Date(DT$Date,format="%d/%m/%Y"))>=as.numeric(
        as.Date("01/02/2007",format="%d/%m/%Y"))
    c2<-as.numeric(as.Date(DT$Date,format="%d/%m/%Y"))<=as.numeric(
        as.Date("02/02/2007",format="%d/%m/%Y"))
    subDT <- DT[c1 & c2]
    
    #Create png file
    png(file = "plot3.png")
    data_time<-as.POSIXct(paste(subDT$Date, subDT$Time), format="%d /%m /%Y %H:%M:%S")
    plot(data_time,subDT$Sub_metering_1, type="l", xlab = NA,
         ylab = "Energy sub metering")
    points(data_time,subDT$Sub_metering_2, col="red", type="l")
    points(data_time,subDT$Sub_metering_3, col="blue", type="l")
    legend("topright", col = c("black", "red", "blue"), lty=c(1,1,1),
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    dev.off()
    
}