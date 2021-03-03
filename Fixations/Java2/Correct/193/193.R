rawdata_193 <- read_tsv("193_rawdata.tsv", comment = "#")

rawdata_193 <- rename(rawdata_193, time = Time)
rawdata_193 <- rename(rawdata_193, trial = Trial)
rawdata_193 <- rename(rawdata_193, x = 'L POR X [px]')
rawdata_193 <- rename(rawdata_193, y = 'L POR Y [px]')

rawdata_193 = rawdata_193[,-c(2)]

rawdata_193 = rawdata_193[,-c(3:20)]

rawdata_193 = rawdata_193[,-c(5:26)]

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle193 <- subset(rawdata_193, time >= 3789843778 & time <= 3834947244)


#Graficando los datos crudos de persona 193 en rectangle

ggplot(rectangle193, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle193_fixations <- subset(detect.fixations(rectangle193))

diagnostic.plot(rectangle193, rectangle193_fixations)

diagnostic.plot(rectangle193, rectangle193_fixations, start.time=3789843778, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle193 <- calculate.summary(rectangle193_fixations)
round(stats_rectangle193, digits=2)

#Ahora para el programa Vehicle ++++

vehicle193 <- subset(rawdata_193, time >= 3887783647 & time <= 3928484920)

#Graficando los datos crudos de persona 193 en Vehicle

ggplot(vehicle193, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle193_fixations <- subset(detect.fixations(vehicle193))

diagnostic.plot(vehicle193, vehicle193_fixations)

diagnostic.plot(vehicle193, vehicle193_fixations, start.time=3887783647, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle193 <- calculate.summary(vehicle193_fixations)
round(stats_vehicle193, digits=2)