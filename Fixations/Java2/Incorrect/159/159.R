rawdata_159 <- read_tsv("159_rawdata.tsv", comment = "#")

rawdata_159 <- rename(rawdata_159, time = Time)
rawdata_159 <- rename(rawdata_159, trial = Trial)
rawdata_159 <- rename(rawdata_159, x = 'L POR X [px]')
rawdata_159 <- rename(rawdata_159, y = 'L POR Y [px]')

rawdata_159 = rawdata_159[,-c(2)]

rawdata_159 = rawdata_159[,-c(3:20)]

rawdata_159 = rawdata_159[,-c(5:26)]


#Ahora para el programa Vehicle ++++

vehicle159 <- subset(rawdata_159, time >= 32439004568 & time <= 32480201635)

#Graficando los datos crudos de persona 159 en Vehicle

ggplot(vehicle159, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle159_fixations <- subset(detect.fixations(vehicle159))

diagnostic.plot(vehicle159, vehicle159_fixations)

diagnostic.plot(vehicle159, vehicle159_fixations, start.time=32439004568, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle159 <- calculate.summary(vehicle159_fixations)
round(stats_vehicle159, digits=2)



#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle159 <- subset(rawdata_159, time >= 32507811659 & time <= 32532182111)


#Graficando los datos crudos de persona 159 en rectangle

ggplot(rectangle159, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle159_fixations <- subset(detect.fixations(rectangle159))

diagnostic.plot(rectangle159, rectangle159_fixations)

diagnostic.plot(rectangle159, rectangle159_fixations, start.time=32507811659, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle159 <- calculate.summary(rectangle159_fixations)
round(stats_rectangle159, digits=2)


