file1 <- "ExAss1/household_power_consumption.txt"
readata1 <- read.table(file1, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subData1 <- readata[readata$Date %in% c("1/2/2007","2/2/2007") ,]
#changing the Date and time format from charactor vector to POSIXlt
Date_time <- strptime(paste(subData1$Date, subData1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
GA_Power1 <- as.numeric(subData1$Global_active_power)
#the plot type is line
plot(Date_time, GA_Power1, type ="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()