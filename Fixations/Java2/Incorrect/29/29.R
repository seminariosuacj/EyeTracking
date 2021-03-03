rawdata_29 <- read_tsv("29_rawdata.tsv", comment = "#")

rawdata_29 <- rename(rawdata_29, time = Time)
rawdata_29 <- rename(rawdata_29, trial = Trial)
rawdata_29 <- rename(rawdata_29, x = 'L POR X [px]')
rawdata_29 <- rename(rawdata_29, y = 'L POR Y [px]')

rawdata_29 = rawdata_29[,-c(2)]

rawdata_29 = rawdata_29[,-c(3:20)]

rawdata_29 = rawdata_29[,-c(5:26)]


#Ahora para el programa Vehicle ++++

vehicle29 <- subset(rawdata_29, time >= 1960967906 & time <= 2009820501)

#Graficando los datos crudos de persona 29 en Vehicle

ggplot(vehicle29, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle29_fixations <- subset(detect.fixations(vehicle29))

diagnostic.plot(vehicle29, vehicle29_fixations)

diagnostic.plot(vehicle29, vehicle29_fixations, start.time=1960967906, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle29 <- calculate.summary(vehicle29_fixations)
round(stats_vehicle29, digits=2)



#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle29 <- subset(rawdata_29, time >= 2039952118 & time <= 2086304816)


#Graficando los datos crudos de persona 29 en rectangle

ggplot(rectangle29, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle29_fixations <- subset(detect.fixations(rectangle29))

diagnostic.plot(rectangle29, rectangle29_fixations)

diagnostic.plot(rectangle29, rectangle29_fixations, start.time=2039952118, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle29 <- calculate.summary(rectangle29_fixations)
round(stats_rectangle29, digits=2)

