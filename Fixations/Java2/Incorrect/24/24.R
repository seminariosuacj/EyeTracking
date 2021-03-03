rawdata_24 <- read_tsv("24_rawdata.tsv", comment = "#")

rawdata_24 <- rename(rawdata_24, time = Time)
rawdata_24 <- rename(rawdata_24, trial = Trial)
rawdata_24 <- rename(rawdata_24, x = 'L POR X [px]')
rawdata_24 <- rename(rawdata_24, y = 'L POR Y [px]')

rawdata_24 = rawdata_24[,-c(2)]

rawdata_24 = rawdata_24[,-c(3:20)]

rawdata_24 = rawdata_24[,-c(5:26)]


#Ahora para el programa Vehicle ++++

vehicle24 <- subset(rawdata_24, time >= 2715589688 & time <= 2771015531)

#Graficando los datos crudos de persona 24 en Vehicle

ggplot(vehicle24, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle24_fixations <- subset(detect.fixations(vehicle24))

diagnostic.plot(vehicle24, vehicle24_fixations)

diagnostic.plot(vehicle24, vehicle24_fixations, start.time=2715589688, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle24 <- calculate.summary(vehicle24_fixations)
round(stats_vehicle24, digits=2)



#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle24 <- subset(rawdata_24, time >= 2814911657 & time <= 2859584607)


#Graficando los datos crudos de persona 24 en rectangle

ggplot(rectangle24, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle24_fixations <- subset(detect.fixations(rectangle24))

diagnostic.plot(rectangle24, rectangle24_fixations)

diagnostic.plot(rectangle24, rectangle24_fixations, start.time=2814911657, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle24 <- calculate.summary(rectangle24_fixations)
round(stats_rectangle24, digits=2)

