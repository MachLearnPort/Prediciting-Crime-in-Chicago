
#Reduce dataset to anything newer than 2010
Crimes_2010_to_present <- subset(Crimes_2001_to_present, Crimes_2001_to_present[ , 18] > 2010) 

#Keep only needed columns
Crimes_2010_to_present_cleaned <- data.frame(Crimes_2010_to_present$Date, Crimes_2010_to_present$`Primary Type`, Crimes_2010_to_present$Latitude, Crimes_2010_to_present$Longitude)

#Change column names
colnames(Crimes_2010_to_present_cleaned) <- c("Date", "Primary Type", "Latitude", "Longitude")

#Verify column names
head(Crimes_2010_to_present_cleaned)

#Extract date from date column
Dates <- format(as.POSIXct(strptime(Crimes_2010_to_present_cleaned$Date,"%d/%m/%Y %H:%M",tz="")) ,format = "%d/%m/%Y")

#Extract time from date column - only by hour
Time <- format(as.POSIXct(strptime(Crimes_2010_to_present_cleaned$Date,"%d/%m/%Y %I:%M:%OS %p",tz="")) ,format = "%I %p")

#Convert from 12 hour to 24 hours
Time <-  format(strptime(Time, "%I %p"), format="%H:%M")

#Add columns to data set
Crimes_2010_to_present_cleaned$Date <- Dates
Crimes_2010_to_present_cleaned$Time <- Time

#verify seperation
head(Crimes_2010_to_present_cleaned)

#Remove uncompleted cases
Crimes_2010_to_present_cleaned <- Crimes_2010_to_present_cleaned[complete.cases(Crimes_2010_to_present_cleaned), ]

#Remove NA's
Crimes_2010_to_present_cleaned <- na.omit(Crimes_2010_to_present_cleaned)

#Write to CSV file - preped for H2O
write.csv(Crimes_2010_to_present_cleaned, file = 'Crimes_2010_to_present_cleaned.csv')




