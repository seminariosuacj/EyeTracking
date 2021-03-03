rawdata_148 <- read_tsv("148_rawdata.tsv", comment = "#")

rawdata_148 <- rename(rawdata_148, time = Time)
rawdata_148 <- rename(rawdata_148, trial = Trial)
rawdata_148 <- rename(rawdata_148, x = 'L POR X [px]')
rawdata_148 <- rename(rawdata_148, y = 'L POR Y [px]')

rawdata_148 = rawdata_148[,-c(2)]

rawdata_148 = rawdata_148[,-c(3:20)]

rawdata_148 = rawdata_148[,-c(5:26)]

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle148 <- subset(rawdata_148, time >= 597157220 & time <= 630842592)


#Graficando los datos crudos de persona 148 en rectangle

ggplot(rectangle148, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle148_fixations <- subset(detect.fixations(rectangle148))

diagnostic.plot(rectangle148, rectangle148_fixations)

diagnostic.plot(rectangle148, rectangle148_fixations, start.time=597157220, duration=1000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle148 <- calculate.summary(rectangle148_fixations)
round(stats_rectangle148, digits=2)

#Ahora para el programa Vehicle ++++

vehicle148 <- subset(rawdata_148, time >= 660532059 & time <= 745976857)

#Graficando los datos crudos de persona 148 en Vehicle

ggplot(vehicle148, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle148_fixations <- subset(detect.fixations(vehicle148))

diagnostic.plot(vehicle148, vehicle148_fixations)

diagnostic.plot(vehicle148, vehicle148_fixations, start.time=660532059, duration=1000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle148 <- calculate.summary(vehicle148_fixations)
round(stats_vehicle148, digits=2)
