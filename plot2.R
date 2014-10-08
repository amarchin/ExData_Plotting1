#This script read the file household_power_consumption.txt and creates
#a plot for Global Active Power VS time.

plot2 <- function() {
    
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
    png(file = "plot2.png")
    data_time<-as.POSIXct(paste(subDT$Date, subDT$Time), format="%d /%m /%Y %H:%M:%S")
    plot(data_time,subDT$Global_active_power, type="l", xlab = NA,
         ylab = "Global Active Power (kilowatts)")
    dev.off()
    
}