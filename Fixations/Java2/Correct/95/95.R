library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_95 <- read_tsv("95_rawdata.tsv", comment = "#")

rawdata_95 <- rename(rawdata_95, time = Time)
rawdata_95 <- rename(rawdata_95, trial = Trial)
rawdata_95 <- rename(rawdata_95, x = 'L POR X [px]')
rawdata_95 <- rename(rawdata_95, y = 'L POR Y [px]')

rawdata_95 = rawdata_95[,-c(2)]

rawdata_95 = rawdata_95[,-c(3:20)]

rawdata_95 = rawdata_95[,-c(5:26)]

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

vehicle95 <- subset(rawdata_95, time >= 6755829097 & time <= 6789090685)


#Graficando los datos crudos de persona 95 en vehicle

ggplot(vehicle95, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle95_fixations <- subset(detect.fixations(vehicle95))

diagnostic.plot(vehicle95, vehicle95_fixations)

diagnostic.plot(vehicle95, vehicle95_fixations, start.time=6755829097, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle95 <- calculate.summary(vehicle95_fixations)
round(stats_vehicle95, digits=2)

#Ahora para el programa rectangle ++++

rectangle95 <- subset(rawdata_95, time >= 6820904287 & time <= 6867263722)

#Graficando los datos crudos de persona 95 en rectangle

ggplot(rectangle95, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle95_fixations <- subset(detect.fixations(rectangle95))

diagnostic.plot(rectangle95, rectangle95_fixations)

diagnostic.plot(rectangle95, rectangle95_fixations, start.time=6820904287, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle95 <- calculate.summary(rectangle95_fixations)
round(stats_rectangle95, digits=2)
