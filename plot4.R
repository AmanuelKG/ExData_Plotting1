#The fellowing plots are all in one form of the two plots we have seen
#The main concern is though how to put all these for plots in one graphic device
file4 <- "ExAss1/household_power_consumption.txt"
readata4 <- read.table(file4, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subData4 <- readata3[readata4$Date %in% c("1/2/2007","2/2/2007") ,]
#changing the Date and time format from charactor vector to POSIXlt
Date_time4 <- strptime(paste(subData4$Date, subData4$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot4.png", width=480, height=480)
#change these Six variables(character vectors) to numeric
GA_Power4 <- as.numeric(subData4$Global_active_power)
sub_Metering1 <- as.numeric(subData4$Sub_metering_1)
sub_Metering2 <- as.numeric(subData4$Sub_metering_2)
sub_Metering3 <- as.numeric(subData4$Sub_metering_3)
GR_Power <- as.numeric(subData4$Global_reactive_power)
Voltage <- as.numeric(subData4$Voltage)
##we are ready to plot 4 plots two in each row and column
par(mfrow = c(2, 2))
#each plot is 80% less than the default plot size i.e Cex=1.
plot(Date_time4, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(Date_time4, Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(Date_time4, sub_Metering1, type="l", ylab="Energy Submetering", xlab="")
lines(Date_time4, sub_Metering2, type="l", col="red")
lines(Date_time4, sub_Metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"),lty=1, lwd=2.5, bty="o")
plot(Date_time4, GR_Power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()