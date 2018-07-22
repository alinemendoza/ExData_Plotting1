###### plot1 ######
## by A.L. Mendoza

## read the dataset
hpc_File <- "household_power_consumption.txt"
hpc <- read.table(hpc_File, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
hpc_subSet <- hpc[data$Date %in% c("1/2/2007","2/2/2007") ,]

## make the histogran on the screen first
hpc_gActivePower <- as.numeric(hpc_subSet$Global_active_power)
hist(hpc_gActivePower, col="red", xlab="Global Active Power (kilowatts)", main = "Global Active Power")

## copying the plot on the screen to the png file - although may not be an exact copy
dev.copy(png, file = "plot1.png",  width=480, height=480)		
dev.off()	
									