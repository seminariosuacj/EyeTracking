library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

rawdata_126 <- read_tsv("126_rawdata.tsv", comment = "#")

rawdata_126 <- rename(rawdata_126, time = Time)
rawdata_126 <- rename(rawdata_126, trial = Trial)
rawdata_126 <- rename(rawdata_126, x = 'L POR X [px]')
rawdata_126 <- rename(rawdata_126, y = 'L POR Y [px]')

rawdata_126 = rawdata_126[,-c(2)]

rawdata_126 = rawdata_126[,-c(3:20)]

rawdata_126 = rawdata_126[,-c(5:26)]

#Ahora para el programa Vehicle ++++

vehicle126 <- subset(rawdata_126, time >= 11449057277 & time <= 11525723455)

#Graficando los datos crudos de persona 126 en Vehicle

ggplot(vehicle126, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle126_fixations <- subset(detect.fixations(vehicle126))

diagnostic.plot(vehicle126, vehicle126_fixations)

diagnostic.plot(vehicle126, vehicle126_fixations, start.time=11449057277, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle126 <- calculate.summary(vehicle126_fixations)
round(stats_vehicle126, digits=2)

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle126 <- subset(rawdata_126, time >= 11547675375 & time <= 11609927286)


#Graficando los datos crudos de persona 126 en rectangle

ggplot(rectangle126, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle126_fixations <- subset(detect.fixations(rectangle126))

diagnostic.plot(rectangle126, rectangle126_fixations)

diagnostic.plot(rectangle126, rectangle126_fixations, start.time=11547675375, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle126 <- calculate.summary(rectangle126_fixations)
round(stats_rectangle126, digits=2)

