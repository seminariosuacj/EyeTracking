rawdata_12 <- read_tsv("12_rawdata.tsv", comment = "#")

rawdata_12 <- rename(rawdata_12, time = Time)
rawdata_12 <- rename(rawdata_12, trial = Trial)
rawdata_12 <- rename(rawdata_12, x = 'L POR X [px]')
rawdata_12 <- rename(rawdata_12, y = 'L POR Y [px]')

rawdata_12 = rawdata_12[,-c(2)]

rawdata_12 = rawdata_12[,-c(3:20)]

rawdata_12 = rawdata_12[,-c(5:26)]


#Ahora para el programa Vehicle ++++

vehicle12 <- subset(rawdata_12, time >= 1655619095 & time <= 1750832690)

#Graficando los datos crudos de persona 12 en Vehicle

ggplot(vehicle12, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle12_fixations <- subset(detect.fixations(vehicle12))

diagnostic.plot(vehicle12, vehicle12_fixations)

diagnostic.plot(vehicle12, vehicle12_fixations, start.time=1655619095, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle12 <- calculate.summary(vehicle12_fixations)
round(stats_vehicle12, digits=2)



#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle12 <- subset(rawdata_12, time >= 1780806555 & time <= 1816840204) 


#Graficando los datos crudos de persona 12 en rectangle

ggplot(rectangle12, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle12_fixations <- subset(detect.fixations(rectangle12))

diagnostic.plot(rectangle12, rectangle12_fixations)

diagnostic.plot(rectangle12, rectangle12_fixations, start.time=1780806555, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle12 <- calculate.summary(rectangle12_fixations)
round(stats_rectangle12, digits=2)

