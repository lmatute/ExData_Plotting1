plot2<- function (filename="household_power_consumption.txt") {
    suppressPackageStartupMessages(library(dplyr))
    library(dplyr)
    # load the data    
    housedata<-read.table(filename,  sep=";",header=TRUE, na.strings= "?")
    # convert date , select the dats and convert the time column to datestime 
    housedata$Date<-as.Date(housedata$Date,"%d/%m/%Y")
    housedata<-subset(housedata,Date>= "2007-02-01" & Date<="2007-02-02")
    housedata$Time<- strptime(paste(housedata$Date,housedata$Time),"%Y-%m-%d %H:%M:%S")
    #Delete unnecesary colum
    housedata<-select(housedata,c(Time,Global_active_power))
    # next we identify the output and graph dimensions
    png(file= "plot2.png",width = 480, height = 480, units = "px", pointsize = 12)
    #..and finnaly genearte the graph
    with(housedata,plot(Time,Global_active_power,type="l",main="Global Active Power (kilowatts)",xlab="",ylab="Global Active Power (kilowatts)"))
    mtext("Plot 2",adj= 0,  line = -1,side =3,outer=T,font = 2)
    dev.off()
    print("plot 2 created")
 
}