rawdata_94 <- read_tsv("94_rawdata.tsv", comment = "#")

rawdata_94 <- rename(rawdata_94, time = Time)
rawdata_94 <- rename(rawdata_94, trial = Trial)
rawdata_94 <- rename(rawdata_94, x = 'L POR X [px]')
rawdata_94 <- rename(rawdata_94, y = 'L POR Y [px]')

rawdata_94 = rawdata_94[,-c(2)]

rawdata_94 = rawdata_94[,-c(3:20)]

rawdata_94 = rawdata_94[,-c(5:26)]

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle94 <- subset(rawdata_94, time >= 5345858646 & time <= 5371589178)


#Graficando los datos crudos de persona 94 en rectangle

ggplot(rectangle94, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle94_fixations <- subset(detect.fixations(rectangle94))

diagnostic.plot(rectangle94, rectangle94_fixations)

diagnostic.plot(rectangle94, rectangle94_fixations, start.time=5345858646, duration=1000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle94 <- calculate.summary(rectangle94_fixations)
round(stats_rectangle94, digits=2)

#Ahora para el programa Vehicle ++++

vehicle94 <- subset(rawdata_94, time >= 5384217530 & time <= 5435912843)

#Graficando los datos crudos de persona 94 en Vehicle

ggplot(vehicle94, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle94_fixations <- subset(detect.fixations(vehicle94))

diagnostic.plot(vehicle94, vehicle94_fixations)

diagnostic.plot(vehicle94, vehicle94_fixations, start.time=5384217530, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle94 <- calculate.summary(vehicle94_fixations)
round(stats_vehicle94, digits=2)
