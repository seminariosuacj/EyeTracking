rawdata_70 <- read_tsv("70_rawdata.tsv", comment = "#")

rawdata_70 <- rename(rawdata_70, time = Time)
rawdata_70 <- rename(rawdata_70, trial = Trial)
rawdata_70 <- rename(rawdata_70, x = 'L POR X [px]')
rawdata_70 <- rename(rawdata_70, y = 'L POR Y [px]')

rawdata_70 = rawdata_70[,-c(2)]

rawdata_70 = rawdata_70[,-c(3:20)]

rawdata_70 = rawdata_70[,-c(5:26)]

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle70 <- subset(rawdata_70, time >= 222472062 & time <= 264257628)


#Graficando los datos crudos de persona 70 en rectangle

ggplot(rectangle70, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle70_fixations <- subset(detect.fixations(rectangle70))

diagnostic.plot(rectangle70, rectangle70_fixations)

diagnostic.plot(rectangle70, rectangle70_fixations, start.time=444054244, duration=41001457, interactive=FALSE, ylim=c(0,1000))

stats_rectangle70 <- calculate.summary(rectangle70_fixations)
round(stats_rectangle70, digits=2)

#Ahora para el programa Vehicle ++++

vehicle70 <- subset(rawdata_70, time >= 288291911 & time <= 331047557)

#Graficando los datos crudos de persona 70 en Vehicle

ggplot(vehicle70, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle70_fixations <- subset(detect.fixations(vehicle70))

diagnostic.plot(vehicle70, vehicle70_fixations)

diagnostic.plot(vehicle70, vehicle70_fixations, start.time=288291911, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle70 <- calculate.summary(vehicle70_fixations)
round(stats_vehicle70, digits=2)
