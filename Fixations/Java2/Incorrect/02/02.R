library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_2 <- read_tsv("2_rawdata.tsv", comment = "#")

rawdata_2 <- rename(rawdata_2, time = Time)
rawdata_2 <- rename(rawdata_2, trial = Trial)
rawdata_2 <- rename(rawdata_2, x = 'L POR X [px]')
rawdata_2 <- rename(rawdata_2, y = 'L POR Y [px]')

rawdata_2 = rawdata_2[,-c(2)]

rawdata_2 = rawdata_2[,-c(3:20)]

rawdata_2 = rawdata_2[,-c(5:26)]

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle2 <- subset(rawdata_2, time >= 15537688106 & time <= 15582532864)


#Graficando los datos crudos de persona 2 en rectangle

ggplot(rectangle2, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle2_fixations <- subset(detect.fixations(rectangle2))

diagnostic.plot(rectangle2, rectangle2_fixations)

diagnostic.plot(rectangle2, rectangle2_fixations, start.time=15537688106, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle2 <- calculate.summary(rectangle2_fixations)
round(stats_rectangle2, digits=2)

#Ahora para el programa Vehicle ++++

vehicle2 <- subset(rawdata_2, time >= 15617102638 & time <= 15671067015)

#Graficando los datos crudos de persona 2 en Vehicle

ggplot(vehicle2, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle2_fixations <- subset(detect.fixations(vehicle2))

diagnostic.plot(vehicle2, vehicle2_fixations)

diagnostic.plot(vehicle2, vehicle2_fixations, start.time=15617102638, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle2 <- calculate.summary(vehicle2_fixations)
round(stats_vehicle2, digits=2)
