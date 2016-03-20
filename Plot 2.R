dataFile <- "./data/household_power_consumption.txt" 
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]  
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") #combine date time, get dates from character format 
globalActivePower <- as.numeric(subSetData$Global_active_power) #Global_active_power is character. plot needs numeric.
png("plot2.png", width=480, height=480) 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)") # type l is for line-plot. xlab is blanked to avoid seeing 'datetime'
dev.off() 
