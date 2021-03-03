rawdata_140 <- read_tsv("140_rawdata.tsv", comment = "#")

rawdata_140 <- rename(rawdata_140, time = Time)
rawdata_140 <- rename(rawdata_140, trial = Trial)
rawdata_140 <- rename(rawdata_140, x = 'L POR X [px]')
rawdata_140 <- rename(rawdata_140, y = 'L POR Y [px]')

rawdata_140 = rawdata_140[,-c(2)]

rawdata_140 = rawdata_140[,-c(3:20)]

rawdata_140 = rawdata_140[,-c(5:26)]


#Ahora para el programa Vehicle ++++

vehicle140 <- subset(rawdata_140, time >= 1079049611 & time <= 1129422121)

#Graficando los datos crudos de persona 140 en Vehicle

ggplot(vehicle140, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle140_fixations <- subset(detect.fixations(vehicle140))

diagnostic.plot(vehicle140, vehicle140_fixations)

diagnostic.plot(vehicle140, vehicle140_fixations, start.time=1079049611, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle140 <- calculate.summary(vehicle140_fixations)
round(stats_vehicle140, digits=2)



#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle140 <- subset(rawdata_140, time >= 1158100094 & time <= 1184570289)


#Graficando los datos crudos de persona 140 en rectangle

ggplot(rectangle140, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle140_fixations <- subset(detect.fixations(rectangle140))

diagnostic.plot(rectangle140, rectangle140_fixations)

diagnostic.plot(rectangle140, rectangle140_fixations, start.time=1158100094, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle140 <- calculate.summary(rectangle140_fixations)
round(stats_rectangle140, digits=2)

