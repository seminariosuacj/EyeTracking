library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_139 <- read_tsv("139_rawdata.tsv", comment = "#")

rawdata_139 <- rename(rawdata_139, trial = Trial)
rawdata_139 <- rename(rawdata_139, x = 'L POR X [px]')
rawdata_139 <- rename(rawdata_139, y = 'L POR Y [px]')

rawdata_139 <- rawdata_139 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 139

rectangle139 <- subset(rawdata_139, Time >= 3482748253 & Time <= 3507366261)

rectangle139$time <- seq.int(nrow(rectangle139))*4
rectangle139 = rectangle139[,-c(1)]
write_tsv(rectangle139,"D:/Mario/Escritorio/Fijaciones/rectangle139.tsv")

ggplot(rectangle139, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle139_fixations <- subset(detect.fixations(rectangle139))

diagnostic.plot(rectangle139, rectangle139_fixations)

diagnostic.plot(rectangle139, rectangle139_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle139 <- calculate.summary(rectangle139_fixations)
round(stats_rectangle139, digits=2)


#Hacer vehicle en 139

vehicle139 <- subset(rawdata_139, Time >= 3527827997 & Time <= 3551442428)

vehicle139$time <- seq.int(nrow(vehicle139))*4
vehicle139 = vehicle139[,-c(1)]
write_tsv(vehicle139,"D:/Mario/Escritorio/Fijaciones/vehicle139.tsv")

ggplot(vehicle139, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle139_fixations <- subset(detect.fixations(vehicle139))

diagnostic.plot(vehicle139, vehicle139_fixations)

diagnostic.plot(vehicle139, vehicle139_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle139 <- calculate.summary(vehicle139_fixations)
round(stats_vehicle139, digits=2)


































