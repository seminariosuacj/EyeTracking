library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

rawdata_124 <- read_tsv("124_rawdata.tsv", comment = "#")

rawdata_124 <- rename(rawdata_124, time = Time)
rawdata_124 <- rename(rawdata_124, trial = Trial)
rawdata_124 <- rename(rawdata_124, x = 'L POR X [px]')
rawdata_124 <- rename(rawdata_124, y = 'L POR Y [px]')

rawdata_124 = rawdata_124[,-c(2)]

rawdata_124 = rawdata_124[,-c(3:20)]

rawdata_124 = rawdata_124[,-c(5:26)]


#Ahora para el programa Vehicle ++++

vehicle124 <- subset(rawdata_124, time >= 251559548 & time <= 337737353)

#Graficando los datos crudos de persona 124 en Vehicle

ggplot(vehicle124, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle124_fixations <- subset(detect.fixations(vehicle124))

diagnostic.plot(vehicle124, vehicle124_fixations)

diagnostic.plot(vehicle124, vehicle124_fixations, start.time=251559548, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle124 <- calculate.summary(vehicle124_fixations)
round(stats_vehicle124, digits=2)

#Aquí para rectangle

rectangle124 <- subset(rawdata_124, time >= 345948695 & time <= 446866346)


#Graficando los datos crudos de persona 124 en rectangle

ggplot(rectangle124, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle124_fixations <- subset(detect.fixations(rectangle124))

diagnostic.plot(rectangle124, rectangle124_fixations)

diagnostic.plot(rectangle124, rectangle124_fixations, start.time=345948695, duration=1000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle124 <- calculate.summary(rectangle124_fixations)
round(stats_rectangle124, digits=2)

