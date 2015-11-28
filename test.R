acc_a <- read.table("./data/SenseView sensor data- 22-11-2015 13-54/ANDACCA2015-11-22-13-54-03.csv",  sep=",", header=F)
names(acc_a) <- c("Date", "Time", "Acceleration_A")
acc_a$Timestamp <- strptime(paste(as.Date(acc_a$Date),acc_a$Time), "%Y-%m-%d %H:%M:%S.")

acc_x <- read.table("./data/SenseView sensor data- 22-11-2015 13-54/ANDACCX2015-11-22-13-54-03.csv",  sep=",", header=F)
names(acc_x) <- c("Date", "Time", "Acceleration_X")
acc_x$Timestamp <- strptime(paste(as.Date(acc_x$Date),acc_x$Time), "%Y-%m-%d %H:%M:%S.")

acc_y <- read.table("./data/SenseView sensor data- 22-11-2015 13-54/ANDACCY2015-11-22-13-54-03.csv",  sep=",", header=F)
names(acc_y) <- c("Date", "Time", "Acceleration_Y")
acc_y$Timestamp <- strptime(paste(as.Date(acc_y$Date),acc_y$Time), "%Y-%m-%d %H:%M:%S.")

acc_z <- read.table("./data/SenseView sensor data- 22-11-2015 13-54/ANDACCX2015-11-22-13-54-03.csv",  sep=",", header=F)
names(acc_z) <- c("Date", "Time", "Acceleration_Z")
acc_z$Timestamp <- strptime(paste(as.Date(acc_z$Date),acc_z$Time), "%Y-%m-%d %H:%M:%S.")

acc <- merge(acc_x, acc_y, by=c("Date","Time","Timestamp"))
acc <- merge(acc, acc_z, by=c("Date","Time","Timestamp"))

ac <- read.table("./data/SenseView sensor data- 22-11-2015 13-54/ANDGPSAC2015-11-22-13-54-03.csv",  sep=",", header=F)
names(ac) <- c("Date", "Time", "ac")
ac$Timestamp <- strptime(paste(as.Date(ac$Date),ac$Time), "%Y-%m-%d %H:%M:%S.")
acc <- merge(acc, ac, by=c("Date","Timestamp"))

al <- read.table("./data/SenseView sensor data- 22-11-2015 13-54/ANDGPSAL2015-11-22-13-54-03.csv",  sep=",", header=F)
names(al) <- c("Date", "Time", "al")
al$Timestamp <- strptime(paste(as.Date(al$Date),al$Time), "%Y-%m-%d %H:%M:%S.")
acc <- merge(acc, al, by=c("Date","Timestamp"))

la <- read.table("./data/SenseView sensor data- 22-11-2015 13-54/ANDGPSLA2015-11-22-13-54-03.csv",  sep=",", header=F)
names(la) <- c("Date", "Time", "la")
la$Timestamp <- strptime(paste(as.Date(la$Date),la$Time), "%Y-%m-%d %H:%M:%S.")
acc <- merge(acc, la, by=c("Date","Timestamp"))

lo <- read.table("./data/SenseView sensor data- 22-11-2015 13-54/ANDGPSLO2015-11-22-13-54-03.csv",  sep=",", header=F)
names(lo) <- c("Date", "Time", "lo")
lo$Timestamp <- strptime(paste(as.Date(lo$Date),lo$Time), "%Y-%m-%d %H:%M:%S.")
acc <- merge(acc, lo, by=c("Date","Timestamp"))

sp <- read.table("./data/SenseView sensor data- 22-11-2015 13-54/ANDGPSSP2015-11-22-13-54-03.csv",  sep=",", header=F)
names(sp) <- c("Date", "Time", "sp")
sp$Timestamp <- strptime(paste(as.Date(sp$Date),sp$Time), "%Y-%m-%d %H:%M:%S.")
acc <- merge(acc, sp, by=c("Date","Timestamp"))
