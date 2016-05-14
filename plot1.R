plot1<- function (filename="household_power_consumption.txt") {
suppressPackageStartupMessages(library(dplyr))
library(dplyr)
# load the data    
housedata<-read.table(filename,sep=";",header=TRUE, na.strings= "?")
# convert date and time to an appropiate format
housedata$Date<-as.Date(housedata$Date,"%d/%m/%Y")
#housedata$Time<- strptime(housedata$Time,"%Y-%m-%d %H:%M:%S")
#Delete unnecesary colum
housedata<-select(housedata,c(Date,Global_active_power))
# next we filter out the days of interest
housedata<-subset(housedata,Date>= "2007-02-01" & Date<="2007-02-02")
# next we identify the output and graph dimensions
png(file= "plot1.png",width = 480, height = 480, units = "px", pointsize = 12)
#..and finnaly genearte the graph
with(housedata,hist(Global_active_power,col = "red",xlab="Global Active Power (kilowats)", ylab="Frequency",main="Global Active Power"))
mtext("Plot 1",adj= 0,  line = -1,side =3,outer=T,font = 2)
dev.off()
print("plot 1 created")
}