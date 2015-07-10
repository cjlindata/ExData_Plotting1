## ExData Course Project Plot1_Plot2
##
##

png(filename = "plot2.png", width = 480, height = 480, units = "px")

epc_df<-read.csv2("household_power_consumption.txt",header=T,stringsAsFactors=F)
## Filter none 2007-02-01 and 2007-02-02 data
epc_df <- epc_df[which(as.Date( as.character(epc_df$Date), "%d/%m/%Y") %in% as.Date(c('2007-02-01','2007-02-02'))),]

x<- paste(epc_df$Date,epc_df$Time, sep=" ")
epc_df$Time <- strptime(x,"%d/%m/%Y %H:%M:%S")
epc_df$Global_active_power <- as.numeric(epc_df$Global_active_power)
plot(epc_df$Time,epc_df$Global_active_power, typ='l', xlab=" ", ylab="Global Active Power (in Kilowatts)")

dev.off()