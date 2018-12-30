df<-read.table("household_power_consumption.txt",
               sep=";",header=TRUE, na.strings="?")
df[,1] <- as.Date(df$Date, "%d/%m/%Y")
d<-df
df[,2]<- strptime(paste(df[,1], d$Time), "%d/%m/%Y %H:%M:%S")
s<- subset(d, Date>="2007-02-01"& Date<="2007-02-02", select = c(names(d)))
png(filename = "plot1.png", width=480, height=480)
h <- hist(as.numeric(s$Global_active_power),
          main="Global Active Power",
          xlab = "Global Active Power (kilowatts)", 
          ylab = "Frequency",
          col = "red",
          ylim = c(0,1200))
dev.off()