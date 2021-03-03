rawdata_213 <- read_tsv("213_rawdata.tsv", comment = "#")

rawdata_213 <- rename(rawdata_213, time = Time)
rawdata_213 <- rename(rawdata_213, trial = Trial)
rawdata_213 <- rename(rawdata_213, x = 'L POR X [px]')
rawdata_213 <- rename(rawdata_213, y = 'L POR Y [px]')

rawdata_213 = rawdata_213[,-c(2)]

rawdata_213 = rawdata_213[,-c(3:20)]

rawdata_213 = rawdata_213[,-c(5:26)]

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle213 <- subset(rawdata_213, time >= 15660778335 & time <= 15699983858)


#Graficando los datos crudos de persona 213 en rectangle

ggplot(rectangle213, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle213_fixations <- subset(detect.fixations(rectangle213))

diagnostic.plot(rectangle213, rectangle213_fixations)

diagnostic.plot(rectangle213, rectangle213_fixations, start.time=15660778335, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle213 <- calculate.summary(rectangle213_fixations)
round(stats_rectangle213, digits=2)

#Ahora para el programa Vehicle ++++

vehicle213 <- subset(rawdata_213, time >= 15721854489 & time <= 15784729746)

#Graficando los datos crudos de persona 213 en Vehicle

ggplot(vehicle213, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle213_fixations <- subset(detect.fixations(vehicle213))

diagnostic.plot(vehicle213, vehicle213_fixations)

diagnostic.plot(vehicle213, vehicle213_fixations, start.time=15721854489, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle213 <- calculate.summary(vehicle213_fixations)
round(stats_vehicle213, digits=2)
