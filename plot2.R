###### plot2 ######
## by A.L. Mendoza

## read the dataset
hpc_File <- "household_power_consumption.txt"
hpc <- read.table(hpc_File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
hpc_subSet <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(hpc_subSet$Date, hpc_subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
hpc_gActivePower <- as.numeric(hpc_subSet$Global_active_power)

## make the line graph on the screen first
plot(datetime, hpc_gActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# copying the plot on the screen to the png file - although may not be an exact copy
dev.copy(png, file = "plot2.png",  width=480, height=480)		
dev.off()

