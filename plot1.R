Full_Data_Frame <- read.table(file.choose(), 
                              header = T,
                              sep = ';',
                              na.strings = "?", 
                              nrows = 2075259,
                              check.names = F,
                              stringsAsFactorsre = F,
                              comment.char = "",
                              quote = '\"')


Data <- subset(Full_Data_Frame, 
               Date %in% c("1/2/2007",
                           "2/2/2007"))


##Convert Date & Time
Data$Date <- as.Date(Data$Date,
                     format = "%d/%m/%Y")

Data$Time <- format(Data$Time,
                    format = "%H:%M:%S")


##Plot & save the histogram of "Global Active Power" as a png
png("plot1.png",
    width = 480,
    height = 480)

hist(Data$Global_active_power,
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col = "Red")

dev.off()