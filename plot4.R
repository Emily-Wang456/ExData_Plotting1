library(dplyr)
data<-read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?",stringsAsFactors=F)
data<-data%>%filter(Date=="1/2/2007"|Date=="2/2/2007")%>%
 mutate(datetime=paste(Date,Time))%>% select(-(Date:Time))
data$datetime<-strptime(data$datetime,"%d/%m/%Y %H:%M:%S")
png(file="plot4.png"£©
par(mfrow=c(2,2))
##plot1
with(data,plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power"))
##plot2
with(data,plot(datetime,Voltage,type="l"))
##plot3
with(data,plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
 with(data,lines(datetime,Sub_metering_2,col="red"))
  with(data,lines(datetime,Sub_metering_3,col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))
##plot4
with(data,plot(datetime,Global_reactive_power,type="l"))
dev.off()