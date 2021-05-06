library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_143 <- read_tsv("143_rawdata.tsv", comment = "#")

rawdata_143 <- rename(rawdata_143, trial = Trial)
rawdata_143 <- rename(rawdata_143, x = 'L POR X [px]')
rawdata_143 <- rename(rawdata_143, y = 'L POR Y [px]')

rawdata_143 <- rawdata_143 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 143

vehicle143 <- subset(rawdata_143, Time >= 3983547099 & Time <= 4027844293)

vehicle143$time <- seq.int(nrow(vehicle143))*4
vehicle143 = vehicle143[,-c(1)]
write_tsv(vehicle143,"D:/Mario/Escritorio/Fijaciones/vehicle143.tsv")

ggplot(vehicle143, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle143_fixations <- subset(detect.fixations(vehicle143))

diagnostic.plot(vehicle143, vehicle143_fixations)

diagnostic.plot(vehicle143, vehicle143_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle143 <- calculate.summary(vehicle143_fixations)
round(stats_vehicle143, digits=2)


#Hacer rectangle en 143

rectangle143 <- subset(rawdata_143, Time >= 4113246509 & Time <= 4139164672)

rectangle143$time <- seq.int(nrow(rectangle143))*4
rectangle143 = rectangle143[,-c(1)]
write_tsv(rectangle143,"D:/Mario/Escritorio/Fijaciones/rectangle143.tsv")

ggplot(rectangle143, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle143_fixations <- subset(detect.fixations(rectangle143))

diagnostic.plot(rectangle143, rectangle143_fixations)

diagnostic.plot(rectangle143, rectangle143_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle143 <- calculate.summary(rectangle143_fixations)
round(stats_rectangle143, digits=2)





































