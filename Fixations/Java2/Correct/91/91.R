rawdata_91 <- read_tsv("91_rawdata.tsv", comment = "#")

rawdata_91 <- rename(rawdata_91, time = Time)
rawdata_91 <- rename(rawdata_91, trial = Trial)
rawdata_91 <- rename(rawdata_91, x = 'L POR X [px]')
rawdata_91 <- rename(rawdata_91, y = 'L POR Y [px]')

rawdata_91 = rawdata_91[,-c(2)]

rawdata_91 = rawdata_91[,-c(3:20)]

rawdata_91 = rawdata_91[,-c(5:26)]

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

vehicle91 <- subset(rawdata_91, time >= 3782807906 & time <= 3839548049)


#Graficando los datos crudos de persona 91 en rectangle

ggplot(vehicle91, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle91_fixations <- subset(detect.fixations(vehicle91))

diagnostic.plot(vehicle91, vehicle91_fixations)

diagnostic.plot(vehicle91, vehicle91_fixations, start.time=3782807906, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle91 <- calculate.summary(vehicle91_fixations)
round(stats_vehicle91, digits=2)

#Ahora para el programa rectangle ++++

rectangle91 <- subset(rawdata_91, time >= 3859591553 & time <= 3897905219)

#Graficando los datos crudos de persona 91 en rectangle

ggplot(rectangle91, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle91_fixations <- subset(detect.fixations(rectangle91))

diagnostic.plot(rectangle91, rectangle91_fixations)

diagnostic.plot(rectangle91, rectangle91_fixations, start.time=3859591553, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle91 <- calculate.summary(rectangle91_fixations)
round(stats_rectangle91, digits=2)
