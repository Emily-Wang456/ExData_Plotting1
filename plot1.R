library(dplyr)
data<-read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?",stringsAsFactors=F)
data<-data%>%filter(Date=="1/2/2007"|Date=="2/2/2007")%>%
 mutate(date_time=paste(Date,Time))%>%select(-(Date:Time))
data$date_time<-strptime(data$date_time,"%d/%m/%Y %H:%M:%S")
png(file="plot1.png")
hist(data$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")
dev.off()

