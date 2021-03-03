rawdata_20 <- read_tsv("20_rawdata.tsv", comment = "#")

rawdata_20 <- rename(rawdata_20, time = Time)
rawdata_20 <- rename(rawdata_20, trial = Trial)
rawdata_20 <- rename(rawdata_20, x = 'L POR X [px]')
rawdata_20 <- rename(rawdata_20, y = 'L POR Y [px]')

rawdata_20 = rawdata_20[,-c(2)]

rawdata_20 = rawdata_20[,-c(3:20)]

rawdata_20 = rawdata_20[,-c(5:26)]

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle20 <- subset(rawdata_20, time >= 1573577432 & time <= 1620326339)


#Graficando los datos crudos de persona 20 en rectangle

ggplot(rectangle20, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle20_fixations <- subset(detect.fixations(rectangle20))

diagnostic.plot(rectangle20, rectangle20_fixations)

diagnostic.plot(rectangle20, rectangle20_fixations, start.time=1573577432, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle20 <- calculate.summary(rectangle20_fixations)
round(stats_rectangle20, digits=2)

#Ahora para el programa Vehicle ++++

vehicle20 <- subset(rawdata_20, time >= 1650413014 & time <= 1720404333)

#Graficando los datos crudos de persona 20 en rectangle en Vehicle

ggplot(vehicle20, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle20_fixations <- subset(detect.fixations(vehicle20))

diagnostic.plot(vehicle20, vehicle20_fixations)

diagnostic.plot(vehicle20, vehicle20_fixations, start.time=1650413014, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle20 <- calculate.summary(vehicle20_fixations)
round(stats_vehicle20, digits=2)
