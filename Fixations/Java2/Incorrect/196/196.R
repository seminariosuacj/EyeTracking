rawdata_196 <- read_tsv("196_rawdata.tsv", comment = "#")

rawdata_196 <- rename(rawdata_196, time = Time)
rawdata_196 <- rename(rawdata_196, trial = Trial)
rawdata_196 <- rename(rawdata_196, x = 'L POR X [px]')
rawdata_196 <- rename(rawdata_196, y = 'L POR Y [px]')

rawdata_196 = rawdata_196[,-c(2)]

rawdata_196 = rawdata_196[,-c(3:20)]

rawdata_196 = rawdata_196[,-c(5:26)]

#Ahora para el programa Vehicle ++++

vehicle196 <- subset(rawdata_196, time >= 9364648999 & time <= 9406906216)

#Graficando los datos crudos de persona 196 en Vehicle

ggplot(vehicle196, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle196_fixations <- subset(detect.fixations(vehicle196))

diagnostic.plot(vehicle196, vehicle196_fixations)

diagnostic.plot(vehicle196, vehicle196_fixations, start.time=9364648999, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle196 <- calculate.summary(vehicle196_fixations)
round(stats_vehicle196, digits=2)

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle196 <- subset(rawdata_196, time >= 9430804613 & time <= 9503239387)


#Graficando los datos crudos de persona 196 en rectangle

ggplot(rectangle196, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed()  +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle196_fixations <- subset(detect.fixations(rectangle196))

diagnostic.plot(rectangle196, rectangle196_fixations)

diagnostic.plot(rectangle196, rectangle196_fixations, start.time=9430804613, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle196 <- calculate.summary(rectangle196_fixations)
round(stats_rectangle196, digits=2)

