#Subsetting and Generating the heat maps
#Packages to install
#install.packages("sp")
#install.packages("raster")
#install.packages("maptools")
#install.packages("mapdata")
#install.packages("mapproj")
#install.packages("ggmap")
#install.packages("DeducerSpatial")
#install.packages("rworldmap")
#install.packages("readr")


library(readr)
#Laptop
#prediction <- read_csv("C:/Users/Jeff/Google Drive/Tailored Process Optimization/TPO/Police_project/Chicago/Predictions/prediction.csv")
#Desktop
prediction <- read_csv("D:/Users/Jeff/Google Drive/Tailored Process Optimization/TPO/Police_project/Chicago/Predictions/prediction.csv")
View(prediction)

#Import reuired packages
require(maps)
require(ggmap)
library(raster)
library(sp)
library(maptools)
gpclibPermit()
library(maptools)
library(mapdata)
library(ggmap)
library(geosphere)
library(maps)
library(ggplot2)

#Laptop
#WD <- "C:\\Users\\Jeff\\Google Drive\\Tailored Process Optimization\\TPO\\Police_project\\Chicago\\Heat_maps\\"
#Desktop
WD <- "D:\\Users\\Jeff\\Google Drive\\Tailored Process Optimization\\TPO\\Police_project\\Chicago\\Heat_maps\\"
setwd(WD)

#ggmap method of importing a map
# Put the lon and lat coordinates for the center of your location of interest
lon <- -87.70018
lat <- 41.88359 

#Subsetting prediction into the lower crime levels and generating plots
#Need to add automated numbering/issuing of folders for hours


#Theft
THEFT <- prediction[prediction$`Primary Type` == 'THEFT',]
map_of_Chicago3 <- get_map(location = c(lon = lon, lat = lat), zoom = 10, maptype = "roadmap", scale = 2) 
gplot <- ggmap(map_of_Chicago3) + stat_density2d(aes(x = Longitude, y = Latitude, fill = ..level.. , alpha = ..level..),size = 2, bins = 15, data = THEFT, geom = 'polygon') + scale_fill_gradient('Theft\nDensity') + scale_alpha(range = c(.1, .5), guide = FALSE) + guides(fill = guide_colorbar(barwidth = 1.5, barheight = 10)) 
gplot #**Uncomment to view plot
filename <- 'Theft' 
#Export plot
width=8 #Width of the the plot 
height=8 #hight of the plot
ggsave(paste(filename, '.pdf', sep=""), gplot, width = width, height = height)
png(file = paste(filename, '_.png', sep=""), width = width * 100, height = height * 100)
print(gplot)

#Trespassing
CRIMINAL_TRESPASS <- prediction[prediction$`Primary Type` == 'CRIMINAL TRESPASS',]
map_of_Chicago3 <- get_map(location = c(lon = lon, lat = lat), zoom = 10, maptype = "roadmap", scale = 2) 
gplot <- ggmap(map_of_Chicago3) + stat_density2d(aes(x = Longitude, y = Latitude, fill = ..level.. , alpha = ..level..),size = 2, bins = 15, data = CRIMINAL_TRESPASS, geom = 'polygon') + scale_fill_gradient('Criminal Trespass\nDensity') + scale_alpha(range = c(.1, .5), guide = FALSE) + guides(fill = guide_colorbar(barwidth = 1.5, barheight = 10)) 
gplot #**Uncomment to view plot
filename <- 'Criminal_Trespass' 
#Export plot
width=8 #Width of the the plot 
height=8 #hight of the plot
ggsave(paste(filename, '.pdf', sep=""), gplot, width = width, height = height)
png(file = paste(filename, '_.png', sep=""), width = width * 100, height = height * 100)
print(gplot)

#Motor Vechicle Theft
MOTOR_VECHICLE_THEFT <- prediction[prediction$`Primary Type` == 'MOTOR VEHICLE THEFT',]
map_of_Chicago3 <- get_map(location = c(lon = lon, lat = lat), zoom = 10, maptype = "roadmap", scale = 2) 
gplot <- ggmap(map_of_Chicago3) + stat_density2d(aes(x = Longitude, y = Latitude, fill = ..level.. , alpha = ..level..),size = 2, bins = 15, data = MOTOR_VECHICLE_THEFT, geom = 'polygon') + scale_fill_gradient('Motor Vechicle\nTheft\nDensity') + scale_alpha(range = c(.1, .5), guide = FALSE) + guides(fill = guide_colorbar(barwidth = 1.5, barheight = 10)) 
gplot #**Uncomment to view plot
filename <- 'Motor_Vechicle_Theft' 
#Export plot
width=8 #Width of the the plot 
height=8 #hight of the plot
ggsave(paste(filename, '.pdf', sep=""), gplot, width = width, height = height)
png(file = paste(filename, '_.png', sep=""), width = width * 100, height = height * 100)
print(gplot)

#Narcotics
NARCOTICS <- prediction[prediction$`Primary Type` == 'NARCOTICS',]
map_of_Chicago3 <- get_map(location = c(lon = lon, lat = lat), zoom = 10, maptype = "roadmap", scale = 2) 
gplot <- ggmap(map_of_Chicago3) + stat_density2d(aes(x = Longitude, y = Latitude, fill = ..level.. , alpha = ..level..),size = 2, bins = 15, data = NARCOTICS, geom = 'polygon') + scale_fill_gradient('Narcotics\nDensity') + scale_alpha(range = c(.1, .5), guide = FALSE) + guides(fill = guide_colorbar(barwidth = 1.5, barheight = 10)) 
gplot #**Uncomment to view plot
filename <- 'Narcotics' 
#Export plot
width=8 #Width of the the plot 
height=8 #hight of the plot
ggsave(paste(filename, '.pdf', sep=""), gplot, width = width, height = height)
png(file = paste(filename, '_.png', sep=""), width = width * 100, height = height * 100)
print(gplot)

#Offense involving childeren
OFFENSE_INVOLVING_CHILDREN <- prediction[prediction$`Primary Type` == 'OFFENSE INVOLVING CHILDREN',]
map_of_Chicago3 <- get_map(location = c(lon = lon, lat = lat), zoom = 10, maptype = "roadmap", scale = 2) 
gplot <- ggmap(map_of_Chicago3) + stat_density2d(aes(x = Longitude, y = Latitude, fill = ..level.. , alpha = ..level..),size = 2, bins = 15, data = OFFENSE_INVOLVING_CHILDREN, geom = 'polygon') + scale_fill_gradient('Offense Involving\nChildren\nDensity') + scale_alpha(range = c(.1, .5), guide = FALSE) + guides(fill = guide_colorbar(barwidth = 1.5, barheight = 10)) 
gplot #**Uncomment to view plot
filename <- 'Offense_Involving_Children' 
#Export plot
width=8 #Width of the the plot 
height=8 #hight of the plot
ggsave(paste(filename, '.pdf', sep=""), gplot, width = width, height = height)
png(file = paste(filename, '_.png', sep=""), width = width * 100, height = height * 100)
print(gplot)

#Assault
ASSAULT <- prediction[prediction$`Primary Type` == 'ASSAULT',]
map_of_Chicago3 <- get_map(location = c(lon = lon, lat = lat), zoom = 10, maptype = "roadmap", scale = 2) 
gplot <- ggmap(map_of_Chicago3) + stat_density2d(aes(x = Longitude, y = Latitude, fill = ..level.. , alpha = ..level..),size = 2, bins = 15, data = ASSAULT, geom = 'polygon') + scale_fill_gradient('Assualt\nDensity') + scale_alpha(range = c(.1, .5), guide = FALSE) + guides(fill = guide_colorbar(barwidth = 1.5, barheight = 10)) 
gplot #**Uncomment to view plot
filename <- 'Assault' 
#Export plot
width=8 #Width of the the plot 
height=8 #hight of the plot
ggsave(paste(filename, '.pdf', sep=""), gplot, width = width, height = height)
png(file = paste(filename, '_.png', sep=""), width = width * 100, height = height * 100)
print(gplot)

#Interference with public officer
INTERFERENCE_WITH_PUBLIC_OFFICER <- prediction[prediction$`Primary Type` == 'INTERFERENCE WITH PUBLIC OFFICER',]
map_of_Chicago3 <- get_map(location = c(lon = lon, lat = lat), zoom = 10, maptype = "roadmap", scale = 2) 
gplot <- ggmap(map_of_Chicago3) + stat_density2d(aes(x = Longitude, y = Latitude, fill = ..level.. , alpha = ..level..),size = 2, bins = 15, data = INTERFERENCE_WITH_PUBLIC_OFFICER, geom = 'polygon') + scale_fill_gradient('interference with\nPublic Officer\nDensity') + scale_alpha(range = c(.1, .5), guide = FALSE) + guides(fill = guide_colorbar(barwidth = 1.5, barheight = 10)) 
gplot #**Uncomment to view plot
filename <- 'Interference_With_Public_Officer' 
#Export plot
width=8 #Width of the the plot 
height=8 #hight of the plot
ggsave(paste(filename, '.pdf', sep=""), gplot, width = width, height = height)
png(file = paste(filename, '_.png', sep=""), width = width * 100, height = height * 100)
print(gplot)

ARSON <- prediction[prediction$`Primary Type` == 'ARSON',]
map_of_Chicago3 <- get_map(location = c(lon = lon, lat = lat), zoom = 10, maptype = "roadmap", scale = 2) 
gplot <- ggmap(map_of_Chicago3) + stat_density2d(aes(x = Longitude, y = Latitude, fill = ..level.. , alpha = ..level..),size = 2, bins = 15, data = ARSON, geom = 'polygon') + scale_fill_gradient('ARSON\nDensity') + scale_alpha(range = c(.1, .5), guide = FALSE) + guides(fill = guide_colorbar(barwidth = 1.5, barheight = 10)) 
gplot #**Uncomment to view plot
filename <- 'ARSON' 
#Export plot
width=8 #Width of the the plot 
height=8 #hight of the plot
ggsave(paste(filename, '.pdf', sep=""), gplot, width = width, height = height)
png(file = paste(filename, '_.png', sep=""), width = width * 100, height = height * 100)
print(gplot)

#Criminal Sexual Assualt
CRIM_SEXUAL_ASSAULT <- prediction[prediction$`Primary Type` == 'CRIM SEXUAL ASSAULT',]
map_of_Chicago3 <- get_map(location = c(lon = lon, lat = lat), zoom = 10, maptype = "roadmap", scale = 2) 
gplot <- ggmap(map_of_Chicago3) + stat_density2d(aes(x = Longitude, y = Latitude, fill = ..level.. , alpha = ..level..),size = 2, bins = 15, data = CRIM_SEXUAL_ASSAULT, geom = 'polygon') + scale_fill_gradient('Criminal\nSexual Assault\nDensity') + scale_alpha(range = c(.1, .5), guide = FALSE) + guides(fill = guide_colorbar(barwidth = 1.5, barheight = 10)) 
gplot #**Uncomment to view plot
filename <- 'Criminal_Sexual_Assault' 
#Export plot
width=8 #Width of the the plot 
height=8 #hight of the plot
ggsave(paste(filename, '.pdf', sep=""), gplot, width = width, height = height)
png(file = paste(filename, '_.png', sep=""), width = width * 100, height = height * 100)
print(gplot)

#Homicide
HOMICIDE <- prediction[prediction$`Primary Type` == 'HOMICIDE',]
map_of_Chicago3 <- get_map(location = c(lon = lon, lat = lat), zoom = 10, maptype = "roadmap", scale = 2) 
gplot <- ggmap(map_of_Chicago3) + stat_density2d(aes(x = Longitude, y = Latitude, fill = ..level.. , alpha = ..level..),size = 2, bins = 15, data = HOMICIDE, geom = 'polygon') + scale_fill_gradient('Homocide\nDensity') + scale_alpha(range = c(.1, .5), guide = FALSE) + guides(fill = guide_colorbar(barwidth = 1.5, barheight = 10)) 
gplot #**Uncomment to view plot
filename <- 'Homicide' 
#Export plot
width=8 #Width of the the plot 
height=8 #hight of the plot
ggsave(paste(filename, '.pdf', sep=""), gplot, width = width, height = height)
png(file = paste(filename, '_.png', sep=""), width = width * 100, height = height * 100)
print(gplot)

#Gambling
GAMBLING <- prediction[prediction$`Primary Type` == 'GAMBLING',]
map_of_Chicago3 <- get_map(location = c(lon = lon, lat = lat), zoom = 10, maptype = "roadmap", scale = 2) 
gplot <- ggmap(map_of_Chicago3) + stat_density2d(aes(x = Longitude, y = Latitude, fill = ..level.. , alpha = ..level..),size = 2, bins = 15, data = GAMBLING, geom = 'polygon') + scale_fill_gradient('Gambling\nDensity') + scale_alpha(range = c(.1, .5), guide = FALSE) + guides(fill = guide_colorbar(barwidth = 1.5, barheight = 10)) 
gplot #**Uncomment to view plot
filename <- 'Gambling' 
#Export plot
width=8 #Width of the the plot 
height=8 #hight of the plot
ggsave(paste(filename, '.pdf', sep=""), gplot, width = width, height = height)
png(file = paste(filename, '_.png', sep=""), width = width * 100, height = height * 100)
print(gplot)

#Intimindation
INTIMIDATION <- prediction[prediction$`Primary Type` == 'INTIMIDATION',]
map_of_Chicago3 <- get_map(location = c(lon = lon, lat = lat), zoom = 10, maptype = "roadmap", scale = 2) 
gplot <- ggmap(map_of_Chicago3) + stat_density2d(aes(x = Longitude, y = Latitude, fill = ..level.. , alpha = ..level..),size = 2, bins = 15, data = INTIMIDATION, geom = 'polygon') + scale_fill_gradient('Intimidation\nDensity') + scale_alpha(range = c(.1, .5), guide = FALSE) + guides(fill = guide_colorbar(barwidth = 1.5, barheight = 10)) 
gplot #**Uncomment to view plot
filename <- 'Intimidation' 
#Export plot
width=8 #Width of the the plot 
height=8 #hight of the plot
ggsave(paste(filename, '.pdf', sep=""), gplot, width = width, height = height)
png(file = paste(filename, '_.png', sep=""), width = width * 100, height = height * 100)
print(gplot)

#Stalking
STALKING <- prediction[prediction$`Primary Type` == 'STALKING',]
map_of_Chicago3 <- get_map(location = c(lon = lon, lat = lat), zoom = 10, maptype = "roadmap", scale = 2) 
gplot <- ggmap(map_of_Chicago3) + stat_density2d(aes(x = Longitude, y = Latitude, fill = ..level.. , alpha = ..level..),size = 2, bins = 15, data = STALKING, geom = 'polygon') + scale_fill_gradient('Stalking\nDensity') + scale_alpha(range = c(.1, .5), guide = FALSE) + guides(fill = guide_colorbar(barwidth = 1.5, barheight = 10)) 
gplot #**Uncomment to view plot
filename <- 'Stalking' 
#Export plot
width=8 #Width of the the plot 
height=8 #hight of the plot
ggsave(paste(filename, '.pdf', sep=""), gplot, width = width, height = height)
png(file = paste(filename, '_.png', sep=""), width = width * 100, height = height * 100)
print(gplot)

#Public Indecency
PUBLIC_INDECENCY <- prediction[prediction$`Primary Type` == 'PUBLIC INDECENCY',]
map_of_Chicago3 <- get_map(location = c(lon = lon, lat = lat), zoom = 10, maptype = "roadmap", scale = 2) 
gplot <- ggmap(map_of_Chicago3) + stat_density2d(aes(x = Longitude, y = Latitude, fill = ..level.. , alpha = ..level..),size = 2, bins = 15, data = PUBLIC_INDECENCY, geom = 'polygon') + scale_fill_gradient('Public Indeceny\nDensity') + scale_alpha(range = c(.1, .5), guide = FALSE) + guides(fill = guide_colorbar(barwidth = 1.5, barheight = 10)) 
gplot #**Uncomment to view plot
filename <- 'Public_Indecency' 
#Export plot
width=8 #Width of the the plot 
height=8 #hight of the plot
ggsave(paste(filename, '.pdf', sep=""), gplot, width = width, height = height)
png(file = paste(filename, '_.png', sep=""), width = width * 100, height = height * 100)
print(gplot)

#Battery
BATTERY <- prediction[prediction$`Primary Type` == 'BATTERY',]
map_of_Chicago3 <- get_map(location = c(lon = lon, lat = lat), zoom = 10, maptype = "roadmap", scale = 2) 
gplot <- ggmap(map_of_Chicago3) + stat_density2d(aes(x = Longitude, y = Latitude, fill = ..level.. , alpha = ..level..),size = 2, bins = 15, data = BATTERY, geom = 'polygon') + scale_fill_gradient('Battery=\nDensity') + scale_alpha(range = c(.1, .5), guide = FALSE) + guides(fill = guide_colorbar(barwidth = 1.5, barheight = 10)) 
gplot #**Uncomment to view plot
filename <- 'Battery' 
#Export plot
width=8 #Width of the the plot 
height=8 #hight of the plot
ggsave(paste(filename, '.pdf', sep=""), gplot, width = width, height = height)
png(file = paste(filename, '_.png', sep=""), width = width * 100, height = height * 100)
print(gplot)

#Other offense
OTHER_OFFENSE <- prediction[prediction$`Primary Type` == 'OTHER OFFENSE',]
map_of_Chicago3 <- get_map(location = c(lon = lon, lat = lat), zoom = 10, maptype = "roadmap", scale = 2) 
gplot <- ggmap(map_of_Chicago3) + stat_density2d(aes(x = Longitude, y = Latitude, fill = ..level.. , alpha = ..level..),size = 2, bins = 15, data = OTHER_OFFENSE, geom = 'polygon') + scale_fill_gradient('Other Offense\nDensity') + scale_alpha(range = c(.1, .5), guide = FALSE) + guides(fill = guide_colorbar(barwidth = 1.5, barheight = 10)) 
gplot #**Uncomment to view plot
filename <- 'Other_Offense' 
#Export plot
width=8 #Width of the the plot 
height=8 #hight of the plot
ggsave(paste(filename, '.pdf', sep=""), gplot, width = width, height = height)
png(file = paste(filename, '_.png', sep=""), width = width * 100, height = height * 100)
print(gplot)

#Criminal_Damage
CRIMINAL_DAMAGE <- prediction[prediction$`Primary Type` == 'CRIMINAL DAMAGE',]
map_of_Chicago3 <- get_map(location = c(lon = lon, lat = lat), zoom = 10, maptype = "roadmap", scale = 2) 
gplot <- ggmap(map_of_Chicago3) + stat_density2d(aes(x = Longitude, y = Latitude, fill = ..level.. , alpha = ..level..),size = 2, bins = 15, data = CRIMINAL_DAMAGE, geom = 'polygon') + scale_fill_gradient('Criminal Damage\nDensity') + scale_alpha(range = c(.1, .5), guide = FALSE) + guides(fill = guide_colorbar(barwidth = 1.5, barheight = 10)) 
gplot #**Uncomment to view plot
filename <- 'Criminal_Damage' 
#Export plot
width=8 #Width of the the plot 
height=8 #hight of the plot
ggsave(paste(filename, '.pdf', sep=""), gplot, width = width, height = height)
png(file = paste(filename, '_.png', sep=""), width = width * 100, height = height * 100)
print(gplot)

#Deceptive Practice
DECEPTIVE_PRACTICE <- prediction[prediction$`Primary Type` == 'DECEPTIVE PRACTICE',]
map_of_Chicago3 <- get_map(location = c(lon = lon, lat = lat), zoom = 10, maptype = "roadmap", scale = 2) 
gplot <- ggmap(map_of_Chicago3) + stat_density2d(aes(x = Longitude, y = Latitude, fill = ..level.. , alpha = ..level..),size = 2, bins = 15, data = DECEPTIVE_PRACTICE, geom = 'polygon') + scale_fill_gradient('Deceptive Practice\nDensity') + scale_alpha(range = c(.1, .5), guide = FALSE) + guides(fill = guide_colorbar(barwidth = 1.5, barheight = 10)) 
gplot #**Uncomment to view plot
filename <- 'Deceptive_Practice' 
#Export plot
width=8 #Width of the the plot 
height=8 #hight of the plot
ggsave(paste(filename, '.pdf', sep=""), gplot, width = width, height = height)
png(file = paste(filename, '_.png', sep=""), width = width * 100, height = height * 100)
print(gplot)

#Robbery
ROBBERY <- prediction[prediction$`Primary Type` == 'ROBBERY',]
map_of_Chicago3 <- get_map(location = c(lon = lon, lat = lat), zoom = 10, maptype = "roadmap", scale = 2) 
gplot <- ggmap(map_of_Chicago3) + stat_density2d(aes(x = Longitude, y = Latitude, fill = ..level.. , alpha = ..level..),size = 2, bins = 15, data = ROBBERY, geom = 'polygon') + scale_fill_gradient('Robbery\nDensity') + scale_alpha(range = c(.1, .5), guide = FALSE) + guides(fill = guide_colorbar(barwidth = 1.5, barheight = 10)) 
gplot #**Uncomment to view plot
filename <- 'Robbery' 
#Export plot
width=8 #Width of the the plot 
height=8 #hight of the plot
ggsave(paste(filename, '.pdf', sep=""), gplot, width = width, height = height)
png(file = paste(filename, '_.png', sep=""), width = width * 100, height = height * 100)
print(gplot)

#Burgalry
BURGLARY <- prediction[prediction$`Primary Type` == 'BURGLARY',]
map_of_Chicago3 <- get_map(location = c(lon = lon, lat = lat), zoom = 10, maptype = "roadmap", scale = 2) 
gplot <- ggmap(map_of_Chicago3) + stat_density2d(aes(x = Longitude, y = Latitude, fill = ..level.. , alpha = ..level..),size = 2, bins = 15, data = BURGLARY, geom = 'polygon') + scale_fill_gradient('Burglary\nDensity') + scale_alpha(range = c(.1, .5), guide = FALSE) + guides(fill = guide_colorbar(barwidth = 1.5, barheight = 10)) 
gplot #**Uncomment to view plot
filename <- 'Burglary' 
#Export plot
width=8 #Width of the the plot 
height=8 #hight of the plot
ggsave(paste(filename, '.pdf', sep=""), gplot, width = width, height = height)
png(file = paste(filename, '_.png', sep=""), width = width * 100, height = height * 100)
print(gplot)

#Public Peace
PUBLIC_PEACE_VIOLATION <- prediction[prediction$`Primary Type` == 'PUBLIC PEACE VIOLATION',]
map_of_Chicago3 <- get_map(location = c(lon = lon, lat = lat), zoom = 10, maptype = "roadmap", scale = 2) 
gplot <- ggmap(map_of_Chicago3) + stat_density2d(aes(x = Longitude, y = Latitude, fill = ..level.. , alpha = ..level..),size = 2, bins = 15, data = PUBLIC_PEACE_VIOLATION, geom = 'polygon') + scale_fill_gradient('Public Peace Violation\nDensity') + scale_alpha(range = c(.1, .5), guide = FALSE) + guides(fill = guide_colorbar(barwidth = 1.5, barheight = 10)) 
gplot #**Uncomment to view plot
filename <- 'Public_Peace_Violations' 
#Export plot
width=8 #Width of the the plot 
height=8 #hight of the plot
ggsave(paste(filename, '.pdf', sep=""), gplot, width = width, height = height)
png(file = paste(filename, '_.png', sep=""), width = width * 100, height = height * 100)
print(gplot)

#Weapons Violation
WEAPONS_VIOLATION <- prediction[prediction$`Primary Type` == 'WEAPONS VIOLATION',]
map_of_Chicago3 <- get_map(location = c(lon = lon, lat = lat), zoom = 10, maptype = "roadmap", scale = 2) 
gplot <- ggmap(map_of_Chicago3) + stat_density2d(aes(x = Longitude, y = Latitude, fill = ..level.. , alpha = ..level..),size = 2, bins = 15, data = WEAPONS_VIOLATION, geom = 'polygon') + scale_fill_gradient('Weapons Violation\nDensity') + scale_alpha(range = c(.1, .5), guide = FALSE) + guides(fill = guide_colorbar(barwidth = 1.5, barheight = 10)) 
gplot #**Uncomment to view plot
filename <- 'Weapons_Violation' 
#Export plot
width=8 #Width of the the plot 
height=8 #hight of the plot
ggsave(paste(filename, '.pdf', sep=""), gplot, width = width, height = height)
png(file = paste(filename, '_.png', sep=""), width = width * 100, height = height * 100)
print(gplot)

#Postituion
PROSTITUTION <- prediction[prediction$`Primary Type` == 'PROSTITUTION',]
map_of_Chicago3 <- get_map(location = c(lon = lon, lat = lat), zoom = 10, maptype = "roadmap", scale = 2) 
gplot <- ggmap(map_of_Chicago3) + stat_density2d(aes(x = Longitude, y = Latitude, fill = ..level.. , alpha = ..level..),size = 2, bins = 15, data = PROSTITUTION, geom = 'polygon') + scale_fill_gradient('Prostituion\nDensity') + scale_alpha(range = c(.1, .5), guide = FALSE) + guides(fill = guide_colorbar(barwidth = 1.5, barheight = 10)) 
gplot #**Uncomment to view plot
filename <- 'Prostitution' 
#Export plot
width=8 #Width of the the plot 
height=8 #hight of the plot
ggsave(paste(filename, '.pdf', sep=""), gplot, width = width, height = height)
png(file = paste(filename, '_.png', sep=""), width = width * 100, height = height * 100)
print(gplot)

#Kiddnapping
KIDNAPPING <- prediction[prediction$`Primary Type` == 'KIDNAPPING',]
map_of_Chicago3 <- get_map(location = c(lon = lon, lat = lat), zoom = 10, maptype = "roadmap", scale = 2) 
gplot <- ggmap(map_of_Chicago3) + stat_density2d(aes(x = Longitude, y = Latitude, fill = ..level.. , alpha = ..level..),size = 2, bins = 15, data = KIDNAPPING, geom = 'polygon') + scale_fill_gradient('Kidnapping\nDensity') + scale_alpha(range = c(.1, .5), guide = FALSE) + guides(fill = guide_colorbar(barwidth = 1.5, barheight = 10)) 
gplot #**Uncomment to view plot
filename <- 'Kidnapping' 
#Export plot
width=8 #Width of the the plot 
height=8 #hight of the plot
ggsave(paste(filename, '.pdf', sep=""), gplot, width = width, height = height)
png(file = paste(filename, '_.png', sep=""), width = width * 100, height = height * 100)
print(gplot)

#Sexual Offense
SEX_OFFENSE <- prediction[prediction$`Primary Type` == 'SEX OFFENSE',]
map_of_Chicago3 <- get_map(location = c(lon = lon, lat = lat), zoom = 10, maptype = "roadmap", scale = 2) 
gplot <- ggmap(map_of_Chicago3) + stat_density2d(aes(x = Longitude, y = Latitude, fill = ..level.. , alpha = ..level..),size = 2, bins = 15, data = SEX_OFFENSE, geom = 'polygon') + scale_fill_gradient('Secual Offense\nDensity') + scale_alpha(range = c(.1, .5), guide = FALSE) + guides(fill = guide_colorbar(barwidth = 1.5, barheight = 10)) 
gplot #**Uncomment to view plot
filename <- 'Sexual_Offense' 
#Export plot
width=8 #Width of the the plot 
height=8 #hight of the plot
ggsave(paste(filename, '.pdf', sep=""), gplot, width = width, height = height)
png(file = paste(filename, '_.png', sep=""), width = width * 100, height = height * 100)
print(gplot)

#Liqour law Violation
LIQUOR_LAW_VIOLATION <- prediction[prediction$`Primary Type` == 'LIQUOR LAW VIOLATION',]
map_of_Chicago3 <- get_map(location = c(lon = lon, lat = lat), zoom = 10, maptype = "roadmap", scale = 2) 
gplot <- ggmap(map_of_Chicago3) + stat_density2d(aes(x = Longitude, y = Latitude, fill = ..level.. , alpha = ..level..),size = 2, bins = 15, data = LIQUOR_LAW_VIOLATION, geom = 'polygon') + scale_fill_gradient('Liqour Viloation\nDensity') + scale_alpha(range = c(.1, .5), guide = FALSE) + guides(fill = guide_colorbar(barwidth = 1.5, barheight = 10)) 
gplot #**Uncomment to view plot
filename <- 'Liqour_Law_Violation' 
#Export plot
width=8 #Width of the the plot 
height=8 #hight of the plot
ggsave(paste(filename, '.pdf', sep=""), gplot, width = width, height = height)
png(file = paste(filename, '_.png', sep=""), width = width * 100, height = height * 100)
print(gplot)

#Obscenity
OBSCENITY <- prediction[prediction$`Primary Type` == 'OBSCENITY',]
map_of_Chicago3 <- get_map(location = c(lon = lon, lat = lat), zoom = 10, maptype = "roadmap", scale = 2) 
gplot <- ggmap(map_of_Chicago3) + stat_density2d(aes(x = Longitude, y = Latitude, fill = ..level.. , alpha = ..level..),size = 2, bins = 15, data = OBSCENITY, geom = 'polygon') + scale_fill_gradient('Obscenity\nDensity') + scale_alpha(range = c(.1, .5), guide = FALSE) + guides(fill = guide_colorbar(barwidth = 1.5, barheight = 10)) 
gplot #**Uncomment to view plot
filename <- 'Obscenity' 
#Export plot
width=8 #Width of the the plot 
height=8 #hight of the plot
ggsave(paste(filename, '.pdf', sep=""), gplot, width = width, height = height)
png(file = paste(filename, '_.png', sep=""), width = width * 100, height = height * 100)
print(gplot)

#Non-Criminal
NON_CRIMINAL <- prediction[prediction$`Primary Type` == 'NON-CRIMINAL',]
map_of_Chicago3 <- get_map(location = c(lon = lon, lat = lat), zoom = 10, maptype = "roadmap", scale = 2) 
gplot <- ggmap(map_of_Chicago3) + stat_density2d(aes(x = Longitude, y = Latitude, fill = ..level.. , alpha = ..level..),size = 2, bins = 15, data = NON_CRIMINAL, geom = 'polygon') + scale_fill_gradient('Non-Criminal\nDensity') + scale_alpha(range = c(.1, .5), guide = FALSE) + guides(fill = guide_colorbar(barwidth = 1.5, barheight = 10)) 
gplot #**Uncomment to view plot
filename <- 'Non-Criminal' 
#Export plot
width=8 #Width of the the plot 
height=8 #hight of the plot
ggsave(paste(filename, '.pdf', sep=""), gplot, width = width, height = height)
png(file = paste(filename, '_.png', sep=""), width = width * 100, height = height * 100)
print(gplot)


