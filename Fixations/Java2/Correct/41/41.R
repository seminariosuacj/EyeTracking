library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_41 <- read_tsv("41_rawdata.tsv", comment = "#")

rawdata_41 <- rename(rawdata_41, time = Time)
rawdata_41 <- rename(rawdata_41, trial = Trial)
rawdata_41 <- rename(rawdata_41, x = 'L POR X [px]')
rawdata_41 <- rename(rawdata_41, y = 'L POR Y [px]')

rawdata_41 = rawdata_41[,-c(2)]

rawdata_41 = rawdata_41[,-c(3:20)]

rawdata_41 = rawdata_41[,-c(5:26)]

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle41 <- subset(rawdata_41, time >= 10754033281 & time <= 10844769846)


#Graficando los datos crudos de persona 41 en rectangle

ggplot(rectangle41, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle41_fixations <- subset(detect.fixations(rectangle41))

diagnostic.plot(rectangle41, rectangle41_fixations)

diagnostic.plot(rectangle41, rectangle41_fixations, start.time=10754033281, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle41 <- calculate.summary(rectangle41_fixations)
round(stats_rectangle41, digits=2)

#Ahora para el programa Vehicle ++++

vehicle41 <- subset(rawdata_41, time >= 10897662191 & time <= 10974335204)

#Graficando los datos crudos de persona 41 en Vehicle

ggplot(vehicle41, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle41_fixations <- subset(detect.fixations(vehicle41))

diagnostic.plot(vehicle41, vehicle41_fixations)

diagnostic.plot(vehicle41, vehicle41_fixations, start.time=10897662191, duration=1000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle41 <- calculate.summary(vehicle41_fixations)
round(stats_vehicle41, digits=2)
