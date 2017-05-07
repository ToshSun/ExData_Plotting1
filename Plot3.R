# Coursera Data Science Course-4 Peer Graded Assignment
# Plot 3
# Generate a line chart of sub_metering_1, sub_metering_2,sub_metering_3
# from Household Power Consumption as of 2007-02-01 and 2007-02-02
# storing output on the PNG file Plot3.png

library(sqldf)
library(reshape2)
datafile<-"./household_power_consumption.txt"
hpc<-read.csv.sql(datafile,"select * from file where Date='1/2/2007' or Date='2/2/2007'",sep=";")
png(filename="./Plot3.png",width=480,height=480)
x<-paste(hpc$Date,hpc$Time)
z<-strptime(x,format="%d/%m/%Y %H:%M:%S",tz="America/New_York")
hpc2<-transform(hpc,Date=z)

with(hpc2,plot(Date,Sub_metering_1,type="l",ylim=c(0,38),ann=FALSE))
par(new=t)
with(hpc2,plot(Date,Sub_metering_2,type="l",col="red",ylim=c(0,38),ann=FALSE))
par(new=t)
with(hpc2,plot(Date,Sub_metering_3,type="l",col="blue",ylim=c(0,38),ylab="Energy sub metering"))

legend("topright", lty=1, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.off()