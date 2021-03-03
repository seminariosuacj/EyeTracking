rawdata_30 <- read_tsv("30_rawdata.tsv", comment = "#")

rawdata_30 <- rename(rawdata_30, time = Time)
rawdata_30 <- rename(rawdata_30, trial = Trial)
rawdata_30 <- rename(rawdata_30, x = 'L POR X [px]')
rawdata_30 <- rename(rawdata_30, y = 'L POR Y [px]')

rawdata_30 = rawdata_30[,-c(2)]

rawdata_30 = rawdata_30[,-c(3:20)]

rawdata_30 = rawdata_30[,-c(5:26)]

#Ahora para el programa Vehicle ++++

vehicle30 <- subset(rawdata_30, time >= 532555296 & time <= 572547918)

#Graficando los datos crudos de persona 30 en Vehicle

ggplot(vehicle30, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle30_fixations <- subset(detect.fixations(vehicle30))

diagnostic.plot(vehicle30, vehicle30_fixations)

diagnostic.plot(vehicle30, vehicle30_fixations, start.time=532555296, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle30 <- calculate.summary(vehicle30_fixations)
round(stats_vehicle30, digits=2)



#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle30 <- subset(rawdata_30, time >= 653645008 & time <= 690421958)


#Graficando los datos crudos de persona 30 en rectangle

ggplot(rectangle30, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle30_fixations <- subset(detect.fixations(rectangle30))

diagnostic.plot(rectangle30, rectangle30_fixations)

diagnostic.plot(rectangle30, rectangle30_fixations, start.time=653645008, duration=1000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle30 <- calculate.summary(rectangle30_fixations)
round(stats_rectangle30, digits=2)

