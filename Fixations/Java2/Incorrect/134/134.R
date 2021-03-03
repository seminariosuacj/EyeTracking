rawdata_134 <- read_tsv("134_rawdata.tsv", comment = "#")

rawdata_134 <- rename(rawdata_134, time = Time)
rawdata_134 <- rename(rawdata_134, trial = Trial)
rawdata_134 <- rename(rawdata_134, x = 'L POR X [px]')
rawdata_134 <- rename(rawdata_134, y = 'L POR Y [px]')

rawdata_134 = rawdata_134[,-c(2)]

rawdata_134 = rawdata_134[,-c(3:20)]

rawdata_134 = rawdata_134[,-c(5:26)]

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle134 <- subset(rawdata_134, time >= 1908567132 & time <= 1928801254)


#Graficando los datos crudos de persona 134 en rectangle

ggplot(rectangle134, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle134_fixations <- subset(detect.fixations(rectangle134))

diagnostic.plot(rectangle134, rectangle134_fixations)

diagnostic.plot(rectangle134, rectangle134_fixations, start.time=1908567132, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle134 <- calculate.summary(rectangle134_fixations)
round(stats_rectangle134, digits=2)

#Ahora para el programa Vehicle ++++

vehicle134 <- subset(rawdata_134, time >= 1938716426 & time <= 1950495268)

#Graficando los datos crudos de persona 134 en Vehicle

ggplot(vehicle134, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle134_fixations <- subset(detect.fixations(vehicle134))

diagnostic.plot(vehicle134, vehicle134_fixations)

diagnostic.plot(vehicle134, vehicle134_fixations, start.time=1938716426, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle134 <- calculate.summary(vehicle134_fixations)
round(stats_vehicle134, digits=2)
