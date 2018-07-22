###### plot3 ######
## by A.L. Mendoza

## read the dataset
hpc_File <- "household_power_consumption.txt"
hpc <- read.table(hpc_File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
hpc_subSet <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(hpc_subSet$Date, hpc_subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
hpc_gActivePower <- as.numeric(hpc_subSet$Global_active_power)
sMeter1 <- as.numeric(hpc_subSet$Sub_metering_1)
sMeter2 <- as.numeric(hpc_subSet$Sub_metering_2)
sMeter3 <- as.numeric(hpc_subSet$Sub_metering_3)

## make the line graph per submeter on the screen first
plot(datetime, sMeter1, type="l", ylab="Energy Sub metering", xlab="")
lines(datetime, sMeter2, type="l", col="red")
lines(datetime, sMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# copying the plot on the screen to the png file - although may not be an exact copy
dev.copy(png, file = "plot3.png",  width=480, height=480)		
dev.off()

