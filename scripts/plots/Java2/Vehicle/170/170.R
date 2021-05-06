library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_170 <- read_tsv("170_rawdata.tsv", comment = "#")

rawdata_170 <- rename(rawdata_170, trial = Trial)
rawdata_170 <- rename(rawdata_170, x = 'L POR X [px]')
rawdata_170 <- rename(rawdata_170, y = 'L POR Y [px]')

rawdata_170 <- rawdata_170 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 170

rectangle170 <- subset(rawdata_170, Time >= 622016495 & Time <= 636412767)

rectangle170$time <- seq.int(nrow(rectangle170))*4
rectangle170 = rectangle170[,-c(1)]
write_tsv(rectangle170,"D:/Mario/Escritorio/Fijaciones/rectangle170.tsv")

ggplot(rectangle170, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle170_fixations <- subset(detect.fixations(rectangle170))

diagnostic.plot(rectangle170, rectangle170_fixations)

diagnostic.plot(rectangle170, rectangle170_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle170 <- calculate.summary(rectangle170_fixations)
round(stats_rectangle170, digits=2)


#Hacer vehicle en 170

vehicle170 <- subset(rawdata_170, Time >= 662172030 & Time <= 739370712)

vehicle170$time <- seq.int(nrow(vehicle170))*4
vehicle170 = vehicle170[,-c(1)]
write_tsv(vehicle170,"D:/Mario/Escritorio/Fijaciones/vehicle170.tsv")

ggplot(vehicle170, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle170_fixations <- subset(detect.fixations(vehicle170))

diagnostic.plot(vehicle170, vehicle170_fixations)

diagnostic.plot(vehicle170, vehicle170_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle170 <- calculate.summary(vehicle170_fixations)
round(stats_vehicle170, digits=2)








