file3 <- "ExAss1/household_power_consumption.txt"
readata3 <- read.table(file3, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subData3 <- readata3[readata3$Date %in% c("1/2/2007","2/2/2007") ,]
#changing the Date and time format from charactor vector to POSIXlt
Date_time3 <- strptime(paste(subData3$Date, subData3$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot3.png", width=480, height=480)
#change these four variables(character vectors) to numeric
GA_Power3 <- as.numeric(subData3$Global_active_power)
sub_Metering1 <- as.numeric(subData3$Sub_metering_1)
sub_Metering2 <- as.numeric(subData3$Sub_metering_2)
sub_Metering3 <- as.numeric(subData3$Sub_metering_3)
plot(Date_time3, sub_Metering1, type="l",xlab = "", ylab="Energy Submetering")
#the plot type is line
#After the plot is ready we add(plot) contents of other variables' relationships
lines(Date_time3, sub_Metering2, col="red",type = "l" )
lines(Date_time3, sub_Metering3,col="blue", type = "l" )
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"), lty=1, lwd=2.5 )
dev.off()