rawdata_168 <- read_tsv("168_rawdata.tsv", comment = "#")

rawdata_168 <- rename(rawdata_168, time = Time)
rawdata_168 <- rename(rawdata_168, trial = Trial)
rawdata_168 <- rename(rawdata_168, x = 'L POR X [px]')
rawdata_168 <- rename(rawdata_168, y = 'L POR Y [px]')

rawdata_168 = rawdata_168[,-c(2)]

rawdata_168 = rawdata_168[,-c(3:20)]

rawdata_168 = rawdata_168[,-c(5:26)]

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle168 <- subset(rawdata_168, time >= 1270630078 & time <= 1403049349)


#Graficando los datos crudos de persona 168 en rectangle

ggplot(rectangle168, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle168_fixations <- subset(detect.fixations(rectangle168))

diagnostic.plot(rectangle168, rectangle168_fixations)

diagnostic.plot(rectangle168, rectangle168_fixations, start.time=1270630078, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle168 <- calculate.summary(rectangle168_fixations)
round(stats_rectangle168, digits=2)

#Ahora para el programa Vehicle ++++

vehicle168 <- subset(rawdata_168, time >= 1434527205 & time <= 1509492692)

#Graficando los datos crudos de persona 168 en Vehicle

ggplot(vehicle168, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle168_fixations <- subset(detect.fixations(vehicle168))

diagnostic.plot(vehicle168, vehicle168_fixations)

diagnostic.plot(vehicle168, vehicle168_fixations, start.time=1434527205, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle168 <- calculate.summary(vehicle168_fixations)
round(stats_vehicle168, digits=2)
