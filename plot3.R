plot3<- function (filename="household_power_consumption.txt") {
suppressPackageStartupMessages(library(dplyr))
library(dplyr)
# load the data    
housedata<-read.table(filename,sep=";",header=TRUE, na.strings= "?")
# convert date , select the dats and convert the time column to datestime 
housedata$Date<-as.Date(housedata$Date,"%d/%m/%Y")
housedata<-subset(housedata,Date>= "2007-02-01" & Date<="2007-02-02")
housedata$Time<- strptime(paste(housedata$Date,housedata$Time),"%Y-%m-%d %H:%M:%S")
# select graph device
png(file= "plot3.png",width = 480, height = 480, units = "px", pointsize = 12)
# generate graph
with(housedata,plot(Time,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(housedata,points(Time,Sub_metering_2,type="l",col="red"))
with(housedata,points(Time,Sub_metering_3,type="l",col="blue"))
mtext("Plot 3",adj= 0,  line = -1,side =3,outer=T,font = 2)
legend("topright",pch=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
print("plot 3 created")
#return(housedata)
}