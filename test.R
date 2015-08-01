acc_x <- read.table("./data/ANDACCX2015-07-27-18-41-41.csv",  sep=",", header=F)
names(acc_x) <- c("Date", "Time", "Acceleration_X")
acc_x$Timestamp <- paste(as.Date(acc_x$Date),acc_x$Time)
##acc_x$Timestamp <- strptime(acc_x$Timestamp, "%Y-%m-%d %H:%M:%S.")

acc_y <- read.table("./data/ANDACCY2015-07-27-18-41-41.csv",  sep=",", header=F)
names(acc_y) <- c("Date", "Time", "Acceleration_Y")
acc_y$Timestamp <- paste(as.Date(acc_y$Date),acc_y$Time)

acc_z <- read.table("./data/ANDACCZ2015-07-27-18-41-41.csv",  sep=",", header=F)
names(acc_z) <- c("Date", "Time", "Acceleration_Z")
acc_z$Timestamp <- paste(as.Date(acc_z$Date),acc_z$Time)

acc <- merge(acc_x, acc_y, by=c("Date","Time","Timestamp"))
acc <- merge(acc, acc_z, by=c("Date","Time","Timestamp"))

lat <- read.table("./data/ANDGPSLA2015-07-27-18-41-41.csv",  sep=",", header=F)
names(lat) <- c("Date", "Time", "Latitude")
lat$Timestamp <- paste(as.Date(lat$Date),lat$Time)

lon <- read.table("./data/ANDGPSLO2015-07-27-18-41-41.csv",  sep=",", header=F)
names(lon) <- c("Date", "Time", "Longitude")
lon$Timestamp <- paste(as.Date(lon$Date),lon$Time)

alt <- read.table("./data/ANDGPSAL2015-07-27-18-41-41.csv",  sep=",", header=F)
names(alt) <- c("Date", "Time", "Altitude")
alt$Timestamp <- paste(as.Date(alt$Date),alt$Time)

points <- merge(lat, lon, by=c("Date","Time","Timestamp"))
points <- merge(points, alt, by=c("Date","Time","Timestamp"))
str(acc)

library(RgoogleMaps)
mymap = MapBackground(lat=points$Latitude, lon=points$Longitude)
PlotOnStaticMap(mymap, points$Latitude , points$Longitude, pch=20, col="#0000ff10", cex=points$Altitude/200)

test <- merge(points, acc, by="Timestamp")

