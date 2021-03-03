rawdata_172 <- read_tsv("172_rawdata.tsv", comment = "#")

rawdata_172 <- rename(rawdata_172, time = Time)
rawdata_172 <- rename(rawdata_172, trial = Trial)
rawdata_172 <- rename(rawdata_172, x = 'L POR X [px]')
rawdata_172 <- rename(rawdata_172, y = 'L POR Y [px]')

rawdata_172 = rawdata_172[,-c(2)]

rawdata_172 = rawdata_172[,-c(3:20)]

rawdata_172 = rawdata_172[,-c(5:26)]

#Ahora para el programa Vehicle ++++

vehicle172 <- subset(rawdata_172, time >= 2265661390 & time <= 2307184999)

#Graficando los datos crudos de persona 172 en Vehicle

ggplot(vehicle172, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle172_fixations <- subset(detect.fixations(vehicle172))

diagnostic.plot(vehicle172, vehicle172_fixations)

diagnostic.plot(vehicle172, vehicle172_fixations, start.time=2265661390, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle172 <- calculate.summary(vehicle172_fixations)
round(stats_vehicle172, digits=2)


#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle172 <- subset(rawdata_172, time >= 2338649627 & time <= 2357424221)


#Graficando los datos crudos de persona 172 en rectangle

ggplot(rectangle172, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle172_fixations <- subset(detect.fixations(rectangle172))

diagnostic.plot(rectangle172, rectangle172_fixations)

diagnostic.plot(rectangle172, rectangle172_fixations, start.time=2338649627, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle172 <- calculate.summary(rectangle172_fixations)
round(stats_rectangle172, digits=2)

