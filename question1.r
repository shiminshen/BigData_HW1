library(fpc)
library(ggmap)

targetFile = './data/small_test.csv'

# read file
data <- read.csv(targetFile)

# retreive the longitude and latitude columns from data
locations = data[6:7]

# remove rows with 0 value
locations = locations[apply(locations, 1, function(x) !all(x==0)),]
# cluster by dbscan
ds <- dbscan(eps=0.003, locations)

# create spatial data for drawing points on map
spData <- locations
# append cluster result
spData$cluster <- ds[[1]]

# create map
targetLon = mean(locations[[1]])
targetLat = mean(locations[[2]])
map <- get_map(location = c(lon=targetLon, lat=targetLat), zoom=10)
ggmap(map) + geom_point(aes(x=pickup_longitude, y=pickup_latitude), data= locations)
# plot(ds, locations)
