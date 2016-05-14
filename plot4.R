plot4<- function (filename="household_power_consumption.txt") {
suppressPackageStartupMessages(library(dplyr))
library(dplyr)
# load the data    
housedata<-read.table(filename,sep=";",header=TRUE, na.strings= "?")
# convert date , select the dats and convert the time column to datestime 
housedata$Date<-as.Date(housedata$Date,"%d/%m/%Y")
housedata<-subset(housedata,Date>= "2007-02-01" & Date<="2007-02-02")
housedata$Time<- strptime(paste(housedata$Date,housedata$Time),"%Y-%m-%d %H:%M:%S")


# select the graph device
png( file= "plot4.png",width = 480, height = 480, units = "px", pointsize = 12)
# ..create 4 graph grid ( 2 x 2)
par(mfrow = c(2,2))
# plot 1
with(housedata,plot(Time,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
# plot 2
with(housedata,plot(Time,Voltage,type="l",xlab="datetime"))
# plot 3
with(housedata,plot(Time,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
legend("topright",pch=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
with(housedata,points(Time,Sub_metering_2,type="l",col="red"))
with(housedata,points(Time,Sub_metering_3,type="l",col="blue"))
# plot 4
with(housedata,plot(Time,Global_reactive_power,type="l",xlab="datetime"))
mtext("Plot 4",adj= 0,  line = -1,side =3,outer=T,font = 2)

dev.off()
print("plot 4 created")
#return(housedata)
}