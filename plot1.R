## ExData Course Project Plot1_Plot1
##
##

png(filename = "plot1.png", width = 480, height = 480, units = "px")

epc_df<-read.csv2("household_power_consumption.txt",header=T,stringsAsFactors=F)
epc_df$Date <- as.Date( as.character(epc_df$Date), "%d/%m/%Y")
#epc_df$Time <- strptime(epc_df$Time,"%H:%M:%S")
## Filter none 2007-02-01 and 2007-02-02 data
epc_df <- epc_df[which(epc_df$Date %in% as.Date(c('2007-02-01','2007-02-02'))),]
epc_df$Global_active_power <- as.numeric(epc_df$Global_active_power)
hist(epc_df$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (in Kilowatts)")

dev.off()