df<-read.table("household_power_consumption.txt",
               sep=";",header=TRUE, na.strings="?")

d <- as.Date(df[,1], "%d/%m/%Y")
dt<-paste(d,as.character(df$Time))
df$DateTime<-strptime(dt,"%Y-%m-%d %H:%M:%S")
#df$DateTime <- strptime(df$DateTime, "%d/%m/%Y %H:%M:%S")


s<- subset(df, DateTime >= "2007-02-01" & DateTime < "2007/02/03")
           
png(filename = "plot2.png", width=480, height=480)
plot(y=s$Global_active_power,x=s$DateTime,type="l",xlab="",ylab="Global Active Power (in kilowatts)")

dev.off()