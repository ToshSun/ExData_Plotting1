# Coursera Data Science Course-4 Peer Graded Assignment
# Plot 4
# Generate 4 line charts from Household Power Consumption as of 2007-02-01 and 2007-02-02
# arranging them 2x2 matrix like figure.
# storing output on the PNG file Plot4.png

library(sqldf)

datafile<-"./household_power_consumption.txt"
hpc<-read.csv.sql(datafile,"select * from file where Date='1/2/2007' or Date='2/2/2007'",sep=";")
png(filename="./Plot4.png",width=480,height=480)
par(mfrow=c(2,2))
x<-paste(hpc$Date,hpc$Time)
z<-strptime(x,format="%d/%m/%Y %H:%M:%S",tz="America/New_York")
hpc2<-transform(hpc,Date=z)
with(hpc2,plot(Date,Global_active_power,type="l",ylab="Global Active Power(kilowatts)"))
with(hpc2,plot(Date,Voltage,type="l",xlab="datetime"))


with(hpc2,plot(Date,Sub_metering_1,type="l",ylim=c(0,38),ann=FALSE))
par(new=t)
with(hpc2,plot(Date,Sub_metering_2,type="l",col="red",ylim=c(0,38),ann=FALSE))
par(new=t)
with(hpc2,plot(Date,Sub_metering_3,type="l",col="blue",ylim=c(0,38),ylab="Energy sub metering"))

legend("topright", lty=1, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

with(hpc2,plot(Date,Global_reactive_power,type="l",xlab="datetime"))


dev.off()