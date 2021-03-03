rawdata_156 <- read_tsv("156_rawdata.tsv", comment = "#")

rawdata_156 <- rename(rawdata_156, time = Time)
rawdata_156 <- rename(rawdata_156, trial = Trial)
rawdata_156 <- rename(rawdata_156, x = 'L POR X [px]')
rawdata_156 <- rename(rawdata_156, y = 'L POR Y [px]')

rawdata_156 = rawdata_156[,-c(2)]

rawdata_156 = rawdata_156[,-c(3:20)]

rawdata_156 = rawdata_156[,-c(5:26)]

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle156 <- subset(rawdata_156, time >= 857440652 & time <= 898839749)


#Graficando los datos crudos de persona 156 en rectangle

ggplot(rectangle156, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle156_fixations <- subset(detect.fixations(rectangle156))

diagnostic.plot(rectangle156, rectangle156_fixations)

diagnostic.plot(rectangle156, rectangle156_fixations, start.time=857440652, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle156 <- calculate.summary(rectangle156_fixations)
round(stats_rectangle156, digits=2)

#Ahora para el programa Vehicle ++++

vehicle156 <- subset(rawdata_156, time >= 949013879 & time <= 1025296389)

#Está persona hizo un click durante la prueba

#Graficando los datos crudos de persona 156 en Vehicle

ggplot(vehicle156, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle156_fixations <- subset(detect.fixations(vehicle156))

diagnostic.plot(vehicle156, vehicle156_fixations)

diagnostic.plot(vehicle156, vehicle156_fixations, start.time=949013879, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle156 <- calculate.summary(vehicle156_fixations)
round(stats_vehicle156, digits=2)
