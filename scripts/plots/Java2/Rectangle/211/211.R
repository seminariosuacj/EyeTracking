library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_211 <- read_tsv("211_rawdata.tsv", comment = "#")

rawdata_211 <- rename(rawdata_211, trial = Trial)
rawdata_211 <- rename(rawdata_211, x = 'L POR X [px]')
rawdata_211 <- rename(rawdata_211, y = 'L POR Y [px]')

rawdata_211 <- rawdata_211 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 211

rectangle211 <- subset(rawdata_211, Time >= 1424243231 & Time <= 1482663190)

rectangle211$time <- seq.int(nrow(rectangle211))*4
rectangle211 = rectangle211[,-c(1)]
write_tsv(rectangle211,"D:/Mario/Escritorio/Fijaciones/rectangle211.tsv")

ggplot(rectangle211, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle211_fixations <- subset(detect.fixations(rectangle211))

diagnostic.plot(rectangle211, rectangle211_fixations)

diagnostic.plot(rectangle211, rectangle211_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle211 <- calculate.summary(rectangle211_fixations)
round(stats_rectangle211, digits=2)

#Hacer vehicle en 211

vehicle211 <- subset(rawdata_211, Time >= 1513868567 & Time <= 1568432718)

vehicle211$time <- seq.int(nrow(vehicle211))*4
vehicle211 = vehicle211[,-c(1)]
write_tsv(vehicle211,"D:/Mario/Escritorio/Fijaciones/vehicle211.tsv")

ggplot(vehicle211, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle211_fixations <- subset(detect.fixations(vehicle211))

diagnostic.plot(vehicle211, vehicle211_fixations)

diagnostic.plot(vehicle211, vehicle211_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle211 <- calculate.summary(vehicle211_fixations)
round(stats_vehicle211, digits=2)










