file<-"ExAss1/household_power_consumption.txt"
readata<-read.table(file,sep = ";",header = TRUE,stringsAsFactors=FALSE, dec = ".")
subData<-readata[readata$Date %in% c("1/2/2007","2/2/2007"),]##subsetting the data for this range of date
##A histogram for the third variable(Global_active_power) in the data
png("plot1.png", width=480, height=480)
GA_Power <- as.numeric(subData$Global_active_power)
hist(GA_Power,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()