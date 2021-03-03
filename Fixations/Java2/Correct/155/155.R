library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

rawdata_155 <- read_tsv("155_rawdata.tsv", comment = "#")

rawdata_155 <- rename(rawdata_155, time = Time)
rawdata_155 <- rename(rawdata_155, trial = Trial)
rawdata_155 <- rename(rawdata_155, x = 'L POR X [px]')
rawdata_155 <- rename(rawdata_155, y = 'L POR Y [px]')

rawdata_155 = rawdata_155[,-c(2)]

rawdata_155 = rawdata_155[,-c(3:20)]

rawdata_155 = rawdata_155[,-c(5:26)]

#Ahora para el programa Vehicle ++++

vehicle155 <- subset(rawdata_155, time >= 4328209248 & time <= 4383025429)

#Graficando los datos crudos de persona 155 en Vehicle

ggplot(vehicle155, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle155_fixations <- subset(detect.fixations(vehicle155))

diagnostic.plot(vehicle155, vehicle155_fixations)

diagnostic.plot(vehicle155, vehicle155_fixations, start.time=4328209248, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle155 <- calculate.summary(vehicle155_fixations)
round(stats_vehicle155, digits=2)

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle155 <- subset(rawdata_155, time >= 4408707706 & time <= 4453188652)


#Graficando los datos crudos de persona 155 en rectangle

ggplot(rectangle155, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle155_fixations <- subset(detect.fixations(rectangle155))

diagnostic.plot(rectangle155, rectangle155_fixations)

diagnostic.plot(rectangle155, rectangle155_fixations, start.time=4408707706, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle155 <- calculate.summary(rectangle155_fixations)
round(stats_rectangle155, digits=2)

