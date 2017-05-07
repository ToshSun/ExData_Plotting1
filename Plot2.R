# Coursera Data Science Course-4 Peer Graded Assignment
# Plot 2
# Generate a line chart of Global Active Power versus Date&Time
# from Household Power Consumption as of 2007-02-01 and 2007-02-02
# storing output on the PNG file Plot2.png

library(sqldf)
datafile<-"./household_power_consumption.txt"
hpc<-read.csv.sql(datafile,"select * from file where Date='1/2/2007' or Date='2/2/2007'",sep=";")
png(filename="./Plot2.png",width=480,height=480)
x<-paste(hpc$Date,hpc$Time)
z<-strptime(x,format="%d/%m/%Y %H:%M:%S",tz="America/New_York")
hpc2<-transform(hpc,Date=z)
with(hpc2,plot(Date,Global_active_power,type="l",ylab="Global Active Power(kilowatts)"))
dev.off()