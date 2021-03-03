library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_89 <- read_tsv("89_rawdata.tsv", comment = "#")

rawdata_89 <- rename(rawdata_89, time = Time)
rawdata_89 <- rename(rawdata_89, trial = Trial)
rawdata_89 <- rename(rawdata_89, x = 'L POR X [px]')
rawdata_89 <- rename(rawdata_89, y = 'L POR Y [px]')

rawdata_89 = rawdata_89[,-c(2)]

rawdata_89 = rawdata_89[,-c(3:20)]

rawdata_89 = rawdata_89[,-c(5:26)]


#Ahora para el programa Vehicle ++++

vehicle89 <- subset(rawdata_89, time >= 1009356355 & time <= 1110625585)

#Graficando los datos crudos de persona 89 en Vehicle

ggplot(vehicle89, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle89_fixations <- subset(detect.fixations(vehicle89))

diagnostic.plot(vehicle89, vehicle89_fixations)

diagnostic.plot(vehicle89, vehicle89_fixations, start.time=1009356355, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle89 <- calculate.summary(vehicle89_fixations)
round(stats_vehicle89, digits=2)



#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle89 <- subset(rawdata_89, time >= 1148884690 & time <= 1214728260)


#Graficando los datos crudos de persona 89 en rectangle

ggplot(rectangle89, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle89_fixations <- subset(detect.fixations(rectangle89))

diagnostic.plot(rectangle89, rectangle89_fixations)

diagnostic.plot(rectangle89, rectangle89_fixations, start.time=1148884690, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle89 <- calculate.summary(rectangle89_fixations)
round(stats_rectangle89, digits=2)

