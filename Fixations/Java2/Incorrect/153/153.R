rawdata_153 <- read_tsv("153_rawdata.tsv", comment = "#")

rawdata_153 <- rename(rawdata_153, time = Time)
rawdata_153 <- rename(rawdata_153, trial = Trial)
rawdata_153 <- rename(rawdata_153, x = 'L POR X [px]')
rawdata_153 <- rename(rawdata_153, y = 'L POR Y [px]')

rawdata_153 = rawdata_153[,-c(2)]

rawdata_153 = rawdata_153[,-c(3:20)]

rawdata_153 = rawdata_153[,-c(5:26)]

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle153 <- subset(rawdata_153, time >= 2159416918 & time <= 2192130282)


#Graficando los datos crudos de persona 153 en rectangle

ggplot(rectangle153, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle153_fixations <- subset(detect.fixations(rectangle153))

diagnostic.plot(rectangle153, rectangle153_fixations)

diagnostic.plot(rectangle153, rectangle153_fixations, start.time=2159416918, duration=1000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle153 <- calculate.summary(rectangle153_fixations)
round(stats_rectangle153, digits=2)

#Ahora para el programa Vehicle ++++

vehicle153 <- subset(rawdata_153, time >= 2215512259 & time <= 2281163774)

#Graficando los datos crudos de persona 153 en Vehicle

ggplot(vehicle153, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle153_fixations <- subset(detect.fixations(vehicle153))

diagnostic.plot(vehicle153, vehicle153_fixations)

diagnostic.plot(vehicle153, vehicle153_fixations, start.time=2215512259, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle153 <- calculate.summary(vehicle153_fixations)
round(stats_vehicle153, digits=2)
