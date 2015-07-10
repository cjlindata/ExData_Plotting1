## ExData Course Project Plot1_Plot2
##
##

png(filename = "plot4.png", width = 480, height = 480, units = "px")

epc_df<-read.csv2("household_power_consumption.txt",header=T,stringsAsFactors=F)
## Filter none 2007-02-01 and 2007-02-02 data
epc_df <- epc_df[which(as.Date( as.character(epc_df$Date), "%d/%m/%Y") %in% as.Date(c('2007-02-01','2007-02-02'))),]

x<- paste(epc_df$Date,epc_df$Time, sep=" ")
epc_df$Time <- strptime(x,"%d/%m/%Y %H:%M:%S")
epc_df$Global_active_power <- as.numeric(epc_df$Global_active_power)
epc_df$Global_reactive_power <- as.numeric(epc_df$Global_reactive_power)
epc_df$Voltage <- as.numeric(epc_df$Voltage)
epc_df$Sub_metering_1 <- as.numeric(epc_df$Sub_metering_1)
epc_df$Sub_metering_2 <- as.numeric(epc_df$Sub_metering_2)
epc_df$Sub_metering_3 <- as.numeric(epc_df$Sub_metering_3)


## plots layout
par(mfcol = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 2))

plot(epc_df$Time,epc_df$Global_active_power, typ='l', xlab=" ", ylab="Global Active Power ")

plot(epc_df$Time,epc_df$Sub_metering_1, type="n", xlab = " ", ylab="Energy Sub metering")
points(epc_df$Time,epc_df$Sub_metering_1, typ='l')
points(epc_df$Time,epc_df$Sub_metering_2, typ='l',col="red")
points(epc_df$Time,epc_df$Sub_metering_3, typ='l',col="blue")
## legend
legend("topright",bty ="n", lty=1 , col = c("black","blue","red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

plot(epc_df$Time,epc_df$Voltage, typ='l', xlab="datetime", ylab="Voltage")

plot(epc_df$Time,epc_df$Global_reactive_power, typ='l', xlab="datetime", ylab="Global_reactive_power")

dev.off()
