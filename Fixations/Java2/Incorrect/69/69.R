rawdata_69 <- read_tsv("69_rawdata.tsv", comment = "#")

rawdata_69 <- rename(rawdata_69, time = Time)
rawdata_69 <- rename(rawdata_69, trial = Trial)
rawdata_69 <- rename(rawdata_69, x = 'L POR X [px]')
rawdata_69 <- rename(rawdata_69, y = 'L POR Y [px]')

rawdata_69 = rawdata_69[,-c(2)]

rawdata_69 = rawdata_69[,-c(3:20)]

rawdata_69 = rawdata_69[,-c(5:26)]

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle69 <- subset(rawdata_69, time >= 1228879765 & time <= 1289929044)


#Graficando los datos crudos de persona 69 en rectangle

ggplot(rectangle69, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle69_fixations <- subset(detect.fixations(rectangle69))

diagnostic.plot(rectangle69, rectangle69_fixations)

diagnostic.plot(rectangle69, rectangle69_fixations, start.time=1228879765, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle69 <- calculate.summary(rectangle69_fixations)
round(stats_rectangle69, digits=2)

#Ahora para el programa Vehicle ++++

vehicle69 <- subset(rawdata_69, time >= 1362827060 & time <= 1441141436)

#Graficando los datos crudos de persona 69 en Vehicle

ggplot(vehicle69, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle69_fixations <- subset(detect.fixations(vehicle69))

diagnostic.plot(vehicle69, vehicle69_fixations)

diagnostic.plot(vehicle69, vehicle69_fixations, start.time=1362827060, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle69 <- calculate.summary(vehicle69_fixations)
round(stats_vehicle69, digits=2)
