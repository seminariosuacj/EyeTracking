library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_216 <- read_tsv("216_rawdata.tsv", comment = "#")

rawdata_216 <- rename(rawdata_216, trial = Trial)
rawdata_216 <- rename(rawdata_216, x = 'L POR X [px]')
rawdata_216 <- rename(rawdata_216, y = 'L POR Y [px]')

rawdata_216 <- rawdata_216 %>%
  select('Time','trial','x','y','L Validity')


#Hacer vehicle en 216

vehicle216 <- subset(rawdata_216, Time >= 406962816 & Time <= 481100215)

vehicle216$time <- seq.int(nrow(vehicle216))*4
vehicle216 = vehicle216[,-c(1)]
write_tsv(vehicle216,"D:/Mario/Escritorio/Fijaciones/vehicle216.tsv")

ggplot(vehicle216, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle216_fixations <- subset(detect.fixations(vehicle216))

diagnostic.plot(vehicle216, vehicle216_fixations)

diagnostic.plot(vehicle216, vehicle216_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle216 <- calculate.summary(vehicle216_fixations)
round(stats_vehicle216, digits=2)



#Hacer rectangle en 216

rectangle216 <- subset(rawdata_216, Time >= 502198746 & Time <= 535731617)

rectangle216$time <- seq.int(nrow(rectangle216))*4
rectangle216 = rectangle216[,-c(1)]
write_tsv(rectangle216,"D:/Mario/Escritorio/Fijaciones/rectangle216.tsv")

ggplot(rectangle216, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle216_fixations <- subset(detect.fixations(rectangle216))

diagnostic.plot(rectangle216, rectangle216_fixations)

diagnostic.plot(rectangle216, rectangle216_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle216 <- calculate.summary(rectangle216_fixations)
round(stats_rectangle216, digits=2)












