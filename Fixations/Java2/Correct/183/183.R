rawdata_183 <- read_tsv("183_rawdata.tsv", comment = "#")

rawdata_183 <- rename(rawdata_183, time = Time)
rawdata_183 <- rename(rawdata_183, trial = Trial)
rawdata_183 <- rename(rawdata_183, x = 'L POR X [px]')
rawdata_183 <- rename(rawdata_183, y = 'L POR Y [px]')

rawdata_183 = rawdata_183[,-c(2)]

rawdata_183 = rawdata_183[,-c(3:20)]

rawdata_183 = rawdata_183[,-c(5:26)]

#Ahora para el programa Vehicle ++++

vehicle183 <- subset(rawdata_183, time >= 436609120 & time <= 528709565)

#Graficando los datos crudos de persona 183 en Vehicle

ggplot(vehicle183, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle183_fixations <- subset(detect.fixations(vehicle183))

diagnostic.plot(vehicle183, vehicle183_fixations)

diagnostic.plot(vehicle183, vehicle183_fixations, start.time=436609120, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle183 <- calculate.summary(vehicle183_fixations)
round(stats_vehicle183, digits=2)


#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle183 <- subset(rawdata_183, time >= 549279625 & time <= 659340839)


#Graficando los datos crudos de persona 183 en rectangle

ggplot(rectangle183, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle183_fixations <- subset(detect.fixations(rectangle183))

diagnostic.plot(rectangle183, rectangle183_fixations)

diagnostic.plot(rectangle183, rectangle183_fixations, start.time=549279625, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle183 <- calculate.summary(rectangle183_fixations)
round(stats_rectangle183, digits=2)

