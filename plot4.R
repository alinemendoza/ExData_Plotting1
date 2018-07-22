###### plot4 ######
## by A.L. Mendoza

## read the dataset
hpc_File <- "household_power_consumption.txt"
hpc <- read.table(hpc_File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
hpc_subSet <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(hpc_subSet$Date, hpc_subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
hpc_gActivePower <- as.numeric(hpc_subSet$Global_active_power)
hpc_gReactivePower <- as.numeric(hpc_subSet$Global_reactive_power)
voltage <- as.numeric(hpc_subSet$Voltage)
sMeter1 <- as.numeric(hpc_subSet$Sub_metering_1)
sMeter2 <- as.numeric(hpc_subSet$Sub_metering_2)
sMeter3 <- as.numeric(hpc_subSet$Sub_metering_3)

## divide the graphing device into two rows and two columns
par(mfrow = c(2, 2)) 

## plot the first graph on first quadrant (upper left)
plot(datetime, hpc_gActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.75)

## plot the second graph on the second quadrant (upper right)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage",cex=0.75)

## plot the third graph on the third quadrant (lower left)
plot(datetime, sMeter1, type="l", ylab="Energy Sub metering", xlab="")
lines(datetime, sMeter2, type="l", col="red")
lines(datetime, sMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), cex=0.75, pt.cex = 0.75)

## plot the fourth graph on the fourth quadrant (lower right)
plot(datetime, hpc_gReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power", cex=0.75)

# copying the plot on the screen to the png file - although may not be an exact copy
dev.copy(png, file = "plot4.png",  width=480, height=480)		
dev.off()
