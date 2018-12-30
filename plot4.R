df<-read.table("household_power_consumption.txt",
               sep=";",header=TRUE, na.strings="?")

d <- as.Date(df[,1], "%d/%m/%Y")
dt<-paste(d,as.character(df$Time))
df$DateTime<-strptime(dt,"%Y-%m-%d %H:%M:%S")
#df$DateTime <- strptime(df$DateTime, "%d/%m/%Y %H:%M:%S")

s<- subset(df, DateTime >= "2007-02-01" & DateTime < "2007/02/03")

png(filename = "plot4.png", width=480, height=480)

par(mfrow=c(2,2),mar=c(4,4,2,2),oma=c(2,2,4,2))

plot(x=s$DateTime,y=s$Global_active_power, type="l",xlab="",ylab="Global Active Power")

plot(x=s$DateTime,y=s$Voltage, type="l",xlab="datetime",ylab="Voltage")

plot(y=s$Sub_metering_1,x=s$DateTime,
     type="l",xlab="",ylab="Energy Sub Metering")
lines(y=s$Sub_metering_2,x=s$DateTime,col="red")
lines(y=s$Sub_metering_3,x=s$DateTime,col="blue")
legend("topright", col = c("black","red","blue"),
       legend=c("Sub_metering_1",
                "Sub_metering_2","Sub_metering_3"),
       bty="n", lty=1, lwd=2, inset= 0.02,cex=0.5)

plot(x=s$DateTime,y=s$Global_reactive_power, type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()