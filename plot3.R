df<-read.table("household_power_consumption.txt",
               sep=";",header=TRUE, na.strings="?")

d <- as.Date(df[,1], "%d/%m/%Y")
dt<-paste(d,as.character(df$Time))
df$DateTime<-strptime(dt,"%Y-%m-%d %H:%M:%S")
#df$DateTime <- strptime(df$DateTime, "%d/%m/%Y %H:%M:%S")

s<- subset(df, DateTime >= "2007-02-01" & DateTime < "2007/02/03")

png(filename = "plot3.png", width=480, height=480)
plot(y=s$Sub_metering_1,x=s$DateTime,
     type="l",xlab="",ylab="Energy Sub Metering")
lines(y=s$Sub_metering_2,x=s$DateTime,col="red")
lines(y=s$Sub_metering_3,x=s$DateTime,col="blue")
legend("topright", col = c("black","red","blue"),
       legend=c("Sub_metering_1",
               "Sub_metering_2","Sub_metering_3"),lty=1, lwd=2)

dev.off()