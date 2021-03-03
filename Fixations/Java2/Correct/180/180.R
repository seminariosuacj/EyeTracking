rawdata_180 <- read_tsv("180_rawdata.tsv", comment = "#")

rawdata_180 <- rename(rawdata_180, time = Time)
rawdata_180 <- rename(rawdata_180, trial = Trial)
rawdata_180 <- rename(rawdata_180, x = 'L POR X [px]')
rawdata_180 <- rename(rawdata_180, y = 'L POR Y [px]')

rawdata_180 = rawdata_180[,-c(2)]

rawdata_180 = rawdata_180[,-c(3:20)]

rawdata_180 = rawdata_180[,-c(5:26)]


#Ahora para el programa Vehicle ++++

vehicle180 <- subset(rawdata_180, time >= 5019519217 & time <= 5059364402)

#Graficando los datos crudos de persona 180 en Vehicle

ggplot(vehicle180, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle180_fixations <- subset(detect.fixations(vehicle180))

diagnostic.plot(vehicle180, vehicle180_fixations)

diagnostic.plot(vehicle180, vehicle180_fixations, start.time=5019519217, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle180 <- calculate.summary(vehicle180_fixations)
round(stats_vehicle180, digits=2)

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle180 <- subset(rawdata_180, time >= 5079751061 & time <= 5113428695)


#Graficando los datos crudos de persona 180 en rectangle

ggplot(rectangle180, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle180_fixations <- subset(detect.fixations(rectangle180))

diagnostic.plot(rectangle180, rectangle180_fixations)

diagnostic.plot(rectangle180, rectangle180_fixations, start.time=5079751061, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle180 <- calculate.summary(rectangle180_fixations)
round(stats_rectangle180, digits=2)
