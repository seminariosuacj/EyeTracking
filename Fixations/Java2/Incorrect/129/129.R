rawdata_129 <- read_tsv("129_rawdata.tsv", comment = "#")

rawdata_129 <- rename(rawdata_129, time = Time)
rawdata_129 <- rename(rawdata_129, trial = Trial)
rawdata_129 <- rename(rawdata_129, x = 'L POR X [px]')
rawdata_129 <- rename(rawdata_129, y = 'L POR Y [px]')

rawdata_129 = rawdata_129[,-c(2)]

rawdata_129 = rawdata_129[,-c(3:20)]

rawdata_129 = rawdata_129[,-c(5:26)]

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle129 <- subset(rawdata_129, time >= 14163056256 & time <= 14193361076)


#Graficando los datos crudos de persona 129 en rectangle

ggplot(rectangle129, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle129_fixations <- subset(detect.fixations(rectangle129))

diagnostic.plot(rectangle129, rectangle129_fixations)

diagnostic.plot(rectangle129, rectangle129_fixations, start.time=14163056256, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle129 <- calculate.summary(rectangle129_fixations)
round(stats_rectangle129, digits=2)

#Ahora para el programa Vehicle ++++

vehicle129 <- subset(rawdata_129, time >= 14231879544 & time <= 14281821129)

#Graficando los datos crudos de persona 129 en Vehicle

ggplot(vehicle129, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle129_fixations <- subset(detect.fixations(vehicle129))

diagnostic.plot(vehicle129, vehicle129_fixations)

diagnostic.plot(vehicle129, vehicle129_fixations, start.time=14231879544, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle129 <- calculate.summary(vehicle129_fixations)
round(stats_vehicle129, digits=2)
