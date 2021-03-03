library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)


setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_16 <- read_tsv("16_rawdata.tsv", comment = "#")
rawdata_16

rawdata_16 <- rename(rawdata_16, time = Time)
rawdata_16 <- rename(rawdata_16, trial = Trial)
rawdata_16 <- rename(rawdata_16, x = 'L POR X [px]')
rawdata_16 <- rename(rawdata_16, y = 'L POR Y [px]')

rawdata_16 = rawdata_16[,-c(2)]

rawdata_16 = rawdata_16[,-c(3:20)]

rawdata_16 = rawdata_16[,-c(5:26)]

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle16 <- subset(rawdata_16, time >= 7480479768 & time <= 7531893948)


#Graficando los datos crudos de persona 16 en rectangle

ggplot(rectangle16, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle16_fixations <- subset(detect.fixations(rectangle16))

diagnostic.plot(rectangle16, rectangle16_fixations)

diagnostic.plot(rectangle16, rectangle16_fixations, start.time=7480479768, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle16 <- calculate.summary(rectangle16_fixations)
round(stats_rectangle16, digits=2)

#Ahora para el programa Vehicle ++++

vehicle16 <- subset(rawdata_16, time >= 7563743653 & time <= 7651466449)

#Graficando los datos crudos de persona 16 en Vehicle

ggplot(vehicle16, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle16_fixations <- subset(detect.fixations(vehicle16))

diagnostic.plot(vehicle16, vehicle16_fixations)

diagnostic.plot(vehicle16, vehicle16_fixations, start.time=7563743653, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle16 <- calculate.summary(vehicle16_fixations)
round(stats_vehicle16, digits=2)
