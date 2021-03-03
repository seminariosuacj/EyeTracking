rawdata_34 <- read_tsv("34_rawdata.tsv", comment = "#")

rawdata_34 <- rename(rawdata_34, time = Time)
rawdata_34 <- rename(rawdata_34, trial = Trial)
rawdata_34 <- rename(rawdata_34, x = 'L POR X [px]')
rawdata_34 <- rename(rawdata_34, y = 'L POR Y [px]')

rawdata_34 = rawdata_34[,-c(2)]

rawdata_34 = rawdata_34[,-c(3:20)]

rawdata_34 = rawdata_34[,-c(5:26)]


#Ahora para el programa Vehicle ++++

vehicle34 <- subset(rawdata_34, time >= 14935905024 & time <= 15002429686)

#Graficando los datos crudos de persona 34 en Vehicle

ggplot(vehicle34, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle34_fixations <- subset(detect.fixations(vehicle34))

diagnostic.plot(vehicle34, vehicle34_fixations)

diagnostic.plot(vehicle34, vehicle34_fixations, start.time=14935905024, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle34 <- calculate.summary(vehicle34_fixations)
round(stats_vehicle34, digits=2)



#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle34 <- subset(rawdata_34, time >= 15055479322 & time <= 15108091699)


#Graficando los datos crudos de persona 34 en rectangle

ggplot(rectangle34, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle34_fixations <- subset(detect.fixations(rectangle34))

diagnostic.plot(rectangle34, rectangle34_fixations)

diagnostic.plot(rectangle34, rectangle34_fixations, start.time=15055479322, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle34 <- calculate.summary(rectangle34_fixations)
round(stats_rectangle34, digits=2)

