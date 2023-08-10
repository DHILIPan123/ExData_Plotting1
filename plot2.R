Full_Data_Frame <- read.table(file.choose(), 
                              header = T,
                              sep = ';',
                              na.strings = "?", 
                              nrows = 2075259,
                              check.names = F,
                              stringsAsFactors = F,
                              comment.char = "",
                              quote = '\"')


##Subsett just the two days we need ("1/2/2007" & "2/2/2007")
Data <- subset(Full_Data_Frame, 
               Date %in% c("1/2/2007",
                           "2/2/2007"))


##Convert Date & Time
Data$Date <- as.Date(Data$Date,
                     format = "%d/%m/%Y")

Data$Time <- format(Data$Time,
                    format = "%H:%M:%S")


##Combine $Date & $Time
Date_Time <- paste(as.Date(Data$Date),
                   Data$Time)


##Convert "Date_Time" to POSIXct and add it to "Data" as a new column
Data$Date_Time <- as.POSIXct(Date_Time)


##Plot "Date_Time" & "Global_active_power"
png("plot2.png",
    width = 480,
    height = 480)

with(Data, 
     {  plot(Global_active_power~Date_Time,
             type = "l",
             ylab = "Global Active Power (kilowatts)",
             xlab = "")  }
)

dev.off()