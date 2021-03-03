rawdata_26 <- read_tsv("26_rawdata.tsv", comment = "#")

rawdata_26 <- rename(rawdata_26, time = Time)
rawdata_26 <- rename(rawdata_26, trial = Trial)
rawdata_26 <- rename(rawdata_26, x = 'L POR X [px]')
rawdata_26 <- rename(rawdata_26, y = 'L POR Y [px]')

rawdata_26 = rawdata_26[,-c(2)]

rawdata_26 = rawdata_26[,-c(3:20)]

rawdata_26 = rawdata_26[,-c(5:26)]

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

vehicle26 <- subset(rawdata_26, time >= 3060345929 & time <= 3112002632)


#Graficando los datos crudos de persona 26 en rectangle

ggplot(vehicle26, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle26_fixations <- subset(detect.fixations(vehicle26))

diagnostic.plot(vehicle26, vehicle26_fixations)

diagnostic.plot(vehicle26, vehicle26_fixations, start.time=3060345929, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle26 <- calculate.summary(vehicle26_fixations)
round(stats_vehicle26, digits=2)

#Ahora para el programa rectangle ++++

rectangle26 <- subset(rawdata_26, time >= 3136928934 & time <= 3167733480)

#Graficando los datos crudos de persona 26 en vehicle en Vehicle

ggplot(rectangle26, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle26_fixations <- subset(detect.fixations(rectangle26))

diagnostic.plot(rectangle26, rectangle26_fixations)

diagnostic.plot(rectangle26, rectangle26_fixations, start.time=3136928934, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle26 <- calculate.summary(rectangle26_fixations)
round(stats_rectangle26, digits=2)
