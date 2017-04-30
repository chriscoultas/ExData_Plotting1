##STEP 0
if (!require("pacman")) install.packages("pacman")
p_load(dplyr, downloader, lubridate)

##STEP 1
#Downloads and unzips the data
setwd("/")
if(!file.exists("Exp Data Wk 1.zip")){
	dir.create("Exp Data Wk 1.zip")
}
setwd("./Exp Data Wk 1.zip")

download("https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip",dest="./Exp Data Wk 1.zip",mode="wb")
unzip("Exp Data Wk 1.zip")
setwd("/Exp Data Wk 1.zip")

##STEP 2
#Load the data

dat<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
dat<-mutate(dat,Dates=dmy(dat$Date))
dat2<-filter(dat,Dates=="2007-02-01" | Dates=="2007-02-02")

##STEP 3
#Create the plot

png(filename="./plot1.png", width=480, height=480, units="px",bg="white")
par(mar=c(4,4,2,1))
with(dat2,hist(Global_active_power,col="red",xlim=c(0,6),ylim=c(0,1200),xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power"))
dev.off()

