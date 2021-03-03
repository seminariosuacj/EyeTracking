library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset/rawdata")

rawdata_135 <- read_tsv("135_rawdata.tsv", comment = "#")

rawdata_135 <- rename(rawdata_135, time = Time)
rawdata_135 <- rename(rawdata_135, trial = Trial)
rawdata_135 <- rename(rawdata_135, x = 'L POR X [px]')
rawdata_135 <- rename(rawdata_135, y = 'L POR Y [px]')

rawdata_135 = rawdata_135[,-c(2)]

rawdata_135 = rawdata_135[,-c(3:20)]

rawdata_135 = rawdata_135[,-c(5:26)]

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle135 <- subset(rawdata_135, time >= 3678399573 & time <= 3743406776)


#Graficando los datos crudos de persona 135 en rectangle

ggplot(rectangle135, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle135_fixations <- subset(detect.fixations(rectangle135))

diagnostic.plot(rectangle135, rectangle135_fixations)

diagnostic.plot(rectangle135, rectangle135_fixations, start.time=3678399573, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle135 <- calculate.summary(rectangle135_fixations)
round(stats_rectangle135, digits=2)

#Ahora para el programa Vehicle ++++

vehicle135 <- subset(rawdata_135, time >= 3799638767 & time <= 3930067786)

#Graficando los datos crudos de persona 135 en Vehicle

ggplot(vehicle135, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle135_fixations <- subset(detect.fixations(vehicle135))

diagnostic.plot(vehicle135, vehicle135_fixations)

diagnostic.plot(vehicle135, vehicle135_fixations, start.time=3799638767, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle135 <- calculate.summary(vehicle135_fixations)
round(stats_vehicle135, digits=2)
