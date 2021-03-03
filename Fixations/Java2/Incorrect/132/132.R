rawdata_132 <- read_tsv("132_rawdata.tsv", comment = "#")

rawdata_132 <- rename(rawdata_132, time = Time)
rawdata_132 <- rename(rawdata_132, trial = Trial)
rawdata_132 <- rename(rawdata_132, x = 'L POR X [px]')
rawdata_132 <- rename(rawdata_132, y = 'L POR Y [px]')

rawdata_132 = rawdata_132[,-c(2)]

rawdata_132 = rawdata_132[,-c(3:20)]

rawdata_132 = rawdata_132[,-c(5:26)]

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle132 <- subset(rawdata_132, time >= 14617747116 & time <= 14724192073)


#Graficando los datos crudos de persona 132 en rectangle

ggplot(rectangle132, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle132_fixations <- subset(detect.fixations(rectangle132))

diagnostic.plot(rectangle132, rectangle132_fixations)

diagnostic.plot(rectangle132, rectangle132_fixations, start.time=14617747116, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle132 <- calculate.summary(rectangle132_fixations)
round(stats_rectangle132, digits=2)

#Ahora para el programa Vehicle ++++

vehicle132 <- subset(rawdata_132, time >= 14763952613 & time <= 14841267219)

#Graficando los datos crudos de persona 132 en Vehicle

ggplot(vehicle132, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle132_fixations <- subset(detect.fixations(vehicle132))

diagnostic.plot(vehicle132, vehicle132_fixations)

diagnostic.plot(vehicle132, vehicle132_fixations, start.time=14763952613, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle132 <- calculate.summary(vehicle132_fixations)
round(stats_vehicle132, digits=2)
