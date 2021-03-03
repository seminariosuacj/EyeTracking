rawdata_214 <- read_tsv("214_rawdata.tsv", comment = "#")

rawdata_214 <- rename(rawdata_214, time = Time)
rawdata_214 <- rename(rawdata_214, trial = Trial)
rawdata_214 <- rename(rawdata_214, x = 'L POR X [px]')
rawdata_214 <- rename(rawdata_214, y = 'L POR Y [px]')

rawdata_214 = rawdata_214[,-c(2)]

rawdata_214 = rawdata_214[,-c(3:20)]

rawdata_214 = rawdata_214[,-c(5:26)]

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle214 <- subset(rawdata_214, time >= 13954977330 & time <= 14011817745)


#Graficando los datos crudos de persona 214 en rectangle

ggplot(rectangle214, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle214_fixations <- subset(detect.fixations(rectangle214))

diagnostic.plot(rectangle214, rectangle214_fixations)

diagnostic.plot(rectangle214, rectangle214_fixations, start.time=13954977330, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle214 <- calculate.summary(rectangle214_fixations)
round(stats_rectangle214, digits=2)

#Ahora para el programa Vehicle ++++

vehicle214 <- subset(rawdata_214, time >= 14059494174 & time <= 14166362877)

#Graficando los datos crudos de persona 214 en Vehicle

ggplot(vehicle214, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle214_fixations <- subset(detect.fixations(vehicle214))

diagnostic.plot(vehicle214, vehicle214_fixations)

diagnostic.plot(vehicle214, vehicle214_fixations, start.time=14059494174, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle214 <- calculate.summary(vehicle214_fixations)
round(stats_vehicle214, digits=2)
