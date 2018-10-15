#R script to generate heatmap for various crimes

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

WD <- "C:\\Users\\Jeff\\Documents\\Test\\GG_plot_test\\Crimes_Module"
setwd(WD)

#Overrides an error
gpclibPermit()

#ggmap method of importing a map
# Put the lon and lat coordinates for the center of your location of interest
lon <- -87.70018
lat <- 41.88359 

#map_of_Chicago <- get_map(location = c(lon = lon, lat = lat), zoom = 12, maptype = "roadmap", scale = 2) 
#ggmap(map_of_Chicago)

#Filters down to offence and location
#Read in dataset
mydata3 = read.csv("~/Test/GG_plot_test/Crimes_2001_to_present_10k.csv")
#head(mydata3)
#Filter out the Crime and location
(mydata3 <- mydata3[,c(7,21,22)]) 
#head(mydata3)

#Plot all crimes in mydata3
ggmap(map_of_Chicago) + geom_point(data = mydata3, aes(x = Longitude, y = Latitude, fill = "red", alpha = 0.8), size = 1, shape = 21) + guides(fill=FALSE, alpha=FALSE, size=FALSE)

#Variable reassignment
(mydata3_THEFT_less <- mydata3)

# Heat Map
map_of_Chicago3 <- get_map(location = c(lon = lon, lat = lat), zoom = 11, maptype = "roadmap", scale = 2) 
#ggmap(map_of_Chicago3) + stat_density2d(aes(x = Longitude, y = Latitude, fill = ..level.., alpha = ..level..),size = 2, bins = 8, data = mydata3_THEFT_less, geom = 'polygon') + scale_fill_gradient('Theft\nDensity') + scale_alpha(range = c(.4, .75), guide = FALSE) + geom_point(data = mydata3_THEFT_less, aes(x = Longitude, y = Latitude), size = 2, fill = "red", shape = 21) + guides(fill = guide_colorbar(barwidth = 1.5, barheight = 10))
#ggmap(map_of_Chicago3) + geom_point(data = mydata3_THEFT_less, aes(x = Longitude, y = Latitude, fill = "red", alpha = 0.8), size = 1, shape = 21) + guides(fill=FALSE, alpha=FALSE, size=FALSE) 
#Note: scale_alpha is the range of transparency of the map
gplot <- ggmap(map_of_Chicago3) + stat_density2d(aes(x = Longitude, y = Latitude, fill = ..level.. , alpha = ..level..),size = 2, bins = 15, data = mydata3_THEFT_less, geom = 'polygon') + scale_fill_gradient('Theft\nDensity') + scale_alpha(range = c(.1, .5), guide = FALSE) + guides(fill = guide_colorbar(barwidth = 1.5, barheight = 10)) 
#gplot

filename <- 'ggplotexport'
#Export plot
width=8 #Width of the the plot 
height=8 #hight of the plot
ggsave(paste(filename, '.pdf', sep=""), gplot, width = width, height = height)
png(file = paste(filename, '_.png', sep=""), width = width * 100, height = height * 100)
print(gplot)
