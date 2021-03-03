rawdata_117 <- read_tsv("117_rawdata.tsv", comment = "#")

rawdata_117 <- rename(rawdata_117, time = Time)
rawdata_117 <- rename(rawdata_117, trial = Trial)
rawdata_117 <- rename(rawdata_117, x = 'L POR X [px]')
rawdata_117 <- rename(rawdata_117, y = 'L POR Y [px]')

rawdata_117 = rawdata_117[,-c(2)]

rawdata_117 = rawdata_117[,-c(3:20)]

rawdata_117 = rawdata_117[,-c(5:26)]

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

vehicle117 <- subset(rawdata_117, time >= 1348874222 & time <= 1447078185)


#Graficando los datos crudos de persona 117 en rectangle

ggplot(vehicle117, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle117_fixations <- subset(detect.fixations(vehicle117))

diagnostic.plot(vehicle117, vehicle117_fixations)

diagnostic.plot(vehicle117, vehicle117_fixations, start.time=1348874222, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle117 <- calculate.summary(vehicle117_fixations)
round(stats_vehicle117, digits=2)

#Ahora para el programa rectangle ++++

rectangle117 <- subset(rawdata_117, time >= 1490283072 & time <= 1580295849)

#Graficando los datos crudos de persona 117 rectangle

ggplot(rectangle117, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle117_fixations <- subset(detect.fixations(rectangle117))

diagnostic.plot(rectangle117, rectangle117_fixations)

diagnostic.plot(rectangle117, rectangle117_fixations, start.time=1490283072, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle117 <- calculate.summary(rectangle117_fixations)
round(stats_rectangle117, digits=2)
