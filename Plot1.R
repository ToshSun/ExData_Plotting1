# Coursera Data Science Course-4 Peer Graded Assignment
# Plot 1
# Generate a histgram of Global Active Power
# from Household Power Consumption as of 2007-02-01 and 2007-02-02
# storing output on the PNG file Plot1.png

library(sqldf)
datafile<-"./household_power_consumption.txt"
hpc<-read.csv.sql(datafile,"select * from file where Date='1/2/2007' or Date='2/2/2007'",sep=";")
png(filename="./Plot1.png",width=480,height=480)
hist(hpc$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()
