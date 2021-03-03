library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_56 <- read_tsv("56_rawdata.tsv", comment = "#")

rawdata_56 <- rename(rawdata_56, time = Time)
rawdata_56 <- rename(rawdata_56, trial = Trial)
rawdata_56 <- rename(rawdata_56, x = 'L POR X [px]')
rawdata_56 <- rename(rawdata_56, y = 'L POR Y [px]')

rawdata_56 = rawdata_56[,-c(2)]

rawdata_56 = rawdata_56[,-c(3:20)]

rawdata_56 = rawdata_56[,-c(5:26)]

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

vehicle56 <- subset(rawdata_56, time >= 9833715407 & time <= 9882288116)


#Graficando los datos crudos de persona 56 en rectangle

ggplot(vehicle56, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle56_fixations <- subset(detect.fixations(vehicle56))

diagnostic.plot(vehicle56, vehicle56_fixations)

diagnostic.plot(vehicle56, vehicle56_fixations, start.time=9833715407, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle56 <- calculate.summary(vehicle56_fixations)
round(stats_vehicle56, digits=2)

#Ahora para el programa rectangle ++++

rectangle56 <- subset(rawdata_56, time >= 9900237244 & time <= 9947140529)

#Graficando los datos crudos de persona 56 en rectangle

ggplot(rectangle56, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle56_fixations <- subset(detect.fixations(rectangle56))

diagnostic.plot(rectangle56, rectangle56_fixations)

diagnostic.plot(rectangle56, rectangle56_fixations, start.time=9900237244, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle56 <- calculate.summary(rectangle56_fixations)
round(stats_rectangle56, digits=2)
