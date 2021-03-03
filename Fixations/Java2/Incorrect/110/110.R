rawdata_110 <- read_tsv("110_rawdata.tsv", comment = "#")

rawdata_110 <- rename(rawdata_110, time = Time)
rawdata_110 <- rename(rawdata_110, trial = Trial)
rawdata_110 <- rename(rawdata_110, x = 'L POR X [px]')
rawdata_110 <- rename(rawdata_110, y = 'L POR Y [px]')

rawdata_110 = rawdata_110[,-c(2)]

rawdata_110 = rawdata_110[,-c(3:20)]

rawdata_110 = rawdata_110[,-c(5:26)]

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle110 <- subset(rawdata_110, time >= 2350915256 & time <= 2382717015)


#Graficando los datos crudos de persona 110 en rectangle

ggplot(rectangle110, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle110_fixations <- subset(detect.fixations(rectangle110))

diagnostic.plot(rectangle110, rectangle110_fixations)

diagnostic.plot(rectangle110, rectangle110_fixations, start.time=2350915256, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle110 <- calculate.summary(rectangle110_fixations)
round(stats_rectangle110, digits=2)

#Ahora para el programa Vehicle ++++

vehicle110 <- subset(rawdata_110, time >= 2416206515 & time <= 2441912408)

#Graficando los datos crudos de persona 110 en Vehicle

ggplot(vehicle110, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle110_fixations <- subset(detect.fixations(vehicle110))

diagnostic.plot(vehicle110, vehicle110_fixations)

diagnostic.plot(vehicle110, vehicle110_fixations, start.time=2416206515, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle110 <- calculate.summary(vehicle110_fixations)
round(stats_vehicle110, digits=2)
