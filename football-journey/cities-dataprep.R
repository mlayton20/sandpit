setwd("/Users/matthewlayton/Documents/GitHub/sandpit/football-journey")
c <- read.csv("cities.csv")
library(rgdal)

#dataMap is a dataframe with coordinates on cols 11 (LATITUDE) and 12 (LONGITUDE)
#Transfor coordinates to numeric
c$LATITUDE  <- as.numeric(c$latitude)
c$LONGITUDE  <- as.numeric(c$longitude)
c.SP  <- SpatialPointsDataFrame(c[,c(4,3)],c[,-c(4,3)])
str(c.SP) # Now is class SpatialPointsDataFrame

#Write as geojson
writeOGR(c.SP, 'cities.geojson','c', driver='GeoJSON',check_exists = FALSE)
