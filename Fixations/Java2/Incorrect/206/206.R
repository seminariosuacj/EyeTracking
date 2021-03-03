rawdata_206 <- read_tsv("206_rawdata.tsv", comment = "#")

rawdata_206 <- rename(rawdata_206, time = Time)
rawdata_206 <- rename(rawdata_206, trial = Trial)
rawdata_206 <- rename(rawdata_206, x = 'L POR X [px]')
rawdata_206 <- rename(rawdata_206, y = 'L POR Y [px]')

rawdata_206 = rawdata_206[,-c(2)]

rawdata_206 = rawdata_206[,-c(3:20)]

rawdata_206 = rawdata_206[,-c(5:26)]


#Ahora para el programa Vehicle ++++

vehicle206 <- subset(rawdata_206, time >= 1563448079 & time <= 1621943190)

#Graficando los datos crudos de persona 206 en Vehicle

ggplot(vehicle206, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle206_fixations <- subset(detect.fixations(vehicle206))

diagnostic.plot(vehicle206, vehicle206_fixations)

diagnostic.plot(vehicle206, vehicle206_fixations, start.time=1563448079, duration=100000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle206 <- calculate.summary(vehicle206_fixations)
round(stats_vehicle206, digits=2)



#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle206 <- subset(rawdata_206, time >= 1656988222 & time <= 1731877891)


#Graficando los datos crudos de persona 206 en rectangle

ggplot(rectangle206, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle206_fixations <- subset(detect.fixations(rectangle206))

diagnostic.plot(rectangle206, rectangle206_fixations)

diagnostic.plot(rectangle206, rectangle206_fixations, start.time=1656988222, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle206 <- calculate.summary(rectangle206_fixations)
round(stats_rectangle206, digits=2)

