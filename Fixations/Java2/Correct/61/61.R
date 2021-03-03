rawdata_61 <- read_tsv("61_rawdata.tsv", comment = "#")

rawdata_61 <- rename(rawdata_61, time = Time)
rawdata_61 <- rename(rawdata_61, trial = Trial)
rawdata_61 <- rename(rawdata_61, x = 'L POR X [px]')
rawdata_61 <- rename(rawdata_61, y = 'L POR Y [px]')

rawdata_61 = rawdata_61[,-c(2)]

rawdata_61 = rawdata_61[,-c(3:20)]

rawdata_61 = rawdata_61[,-c(5:26)]

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

vehicle61 <- subset(rawdata_61, time >= 757752764 & time <= 812433070)


#Graficando los datos crudos de persona 61 en rectangle

ggplot(vehicle61, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle61_fixations <- subset(detect.fixations(vehicle61))

diagnostic.plot(vehicle61, vehicle61_fixations)

diagnostic.plot(vehicle61, vehicle61_fixations, start.time=757752764, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle61 <- calculate.summary(vehicle61_fixations)
round(stats_vehicle61, digits=2)

#Ahora para el programa rectangle ++++

rectangle61 <- subset(rawdata_61, time >= 859736330 & time <= 941433395)

#Graficando los datos crudos de persona 61 en rectangle en Vehicle

ggplot(rectangle61, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle61_fixations <- subset(detect.fixations(rectangle61))

diagnostic.plot(rectangle61, rectangle61_fixations)

diagnostic.plot(rectangle61, rectangle61_fixations, start.time=859736330, duration=1000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle61 <- calculate.summary(rectangle61_fixations)
round(stats_rectangle61, digits=2)
