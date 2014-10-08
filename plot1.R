#This script read the file household_power_consumption.txt and creates
#a frequency histogram for the Global Active Power.

plot1 <- function() {
    
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
    png(file = "plot1.png")
    hist(as.numeric(subDT$Global_active_power), xlab = NA,
         main = "Global Active Power", col = "red")
    mtext(side = 1, "Global Active Power (kilowatts)", line = 2)
    dev.off()

}