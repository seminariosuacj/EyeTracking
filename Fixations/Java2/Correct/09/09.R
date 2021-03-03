library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_9 <- read_tsv("9_rawdata.tsv", comment = "#")

rawdata_9 <- rename(rawdata_9, time = Time)
rawdata_9 <- rename(rawdata_9, trial = Trial)
rawdata_9 <- rename(rawdata_9, x = 'L POR X [px]')
rawdata_9 <- rename(rawdata_9, y = 'L POR Y [px]')

rawdata_9 = rawdata_9[,-c(2)]

rawdata_9 = rawdata_9[,-c(3:20)]

rawdata_9 = rawdata_9[,-c(5:26)]


rectangle9 <- subset(rawdata_9, time >= 444054244 & time <= 485723907)


#Graficando los datos crudos de persona 9 en rectangle

ggplot(rectangle9, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle9_fixations <- subset(detect.fixations(rectangle9))

diagnostic.plot(rectangle9, rectangle9_fixations)

diagnostic.plot(rectangle9, rectangle9_fixations, start.time=444054244, duration=41001457, interactive=FALSE, ylim=c(0,1000))

stats_rectangle9 <- calculate.summary(rectangle9_fixations)
round(stats_rectangle9, digits=2)

#Ahora para el programa Vehicle +++

vehicle9 <- subset(rawdata_9, time >= 516841463 & time <= 586399121)

#Graficando los datos crudos de persona 9 en rectangle

ggplot(vehicle9, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle9_fixations <- subset(detect.fixations(vehicle9))

diagnostic.plot(vehicle9, vehicle9_fixations)

diagnostic.plot(vehicle9, vehicle9_fixations, start.time=516841463, duration=3000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle9 <- calculate.summary(vehicle9_fixations)
round(stats_vehicle9, digits=2)