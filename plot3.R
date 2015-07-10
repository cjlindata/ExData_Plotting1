## ExData Course Project Plot1_Plot3
##
##
png(filename = "plot3.png", width = 480, height = 480, units = "px")

epc_df<-read.csv2("household_power_consumption.txt",header=T,stringsAsFactors=F)
## Filter none 2007-02-01 and 2007-02-02 data
epc_df <- epc_df[which(as.Date( as.character(epc_df$Date), "%d/%m/%Y") %in% as.Date(c('2007-02-01','2007-02-02'))),]

x<- paste(epc_df$Date,epc_df$Time, sep=" ")
epc_df$Time <- strptime(x,"%d/%m/%Y %H:%M:%S")
epc_df$Sub_metering_1 <- as.numeric(epc_df$Sub_metering_1)
epc_df$Sub_metering_2 <- as.numeric(epc_df$Sub_metering_2)
epc_df$Sub_metering_3 <- as.numeric(epc_df$Sub_metering_3)

plot(epc_df$Time,epc_df$Sub_metering_1, type="n", xlab = " ", ylab="Energy Sub metering")
points(epc_df$Time,epc_df$Sub_metering_1, typ='l')
points(epc_df$Time,epc_df$Sub_metering_2, typ='l',col="red")
points(epc_df$Time,epc_df$Sub_metering_3, typ='l',col="blue")

## legend
legend("topright", lty=1 , col = c("black","blue","red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.off()