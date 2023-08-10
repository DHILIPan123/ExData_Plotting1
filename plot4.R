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


##Save
png("plot4.png",
    width = 480,
    height = 480)


##Set the parameters for the graphs
par(mfrow = c(2,2),
    mar = c(4,4,2,1),
    oma = c(0,0,2,0))


##Plotting (Using 1 function)
with(Data,
     {  plot(Global_active_power~Date_Time,
             type = "l",
             ylab = "Global Active Power",
             xlab = "")
       
       plot(Voltage~Date_Time,
            type = "l",
            ylab = "Voltage",
            xlab = "")
       
       plot(Sub_metering_1~Date_Time,
            type = "l",
            ylab = "Energy sub metering",
            xlab = "")
       
       lines(Sub_metering_2~Date_Time,
             col = 'Red')
       
       lines(Sub_metering_3~Date_Time,
             col = 'Blue')
       
       legend("topright",
              col = c("black",
                      "red",
                      "blue"),
              lty=2,
              lwd=2,
              legend = c("Sub_metering_1",
                         "Sub_metering_2",
                         "Sub_metering_3"))
       
       plot(Global_reactive_power~Date_Time,
            type = "l",
            ylab = "Global_reactive_power",
            xlab = "") })


dev.off()