rawdata_44 <- read_tsv("44_rawdata.tsv", comment = "#")

rawdata_44 <- rename(rawdata_44, time = Time)
rawdata_44 <- rename(rawdata_44, trial = Trial)
rawdata_44 <- rename(rawdata_44, x = 'L POR X [px]')
rawdata_44 <- rename(rawdata_44, y = 'L POR Y [px]')

rawdata_44 = rawdata_44[,-c(2)]

rawdata_44 = rawdata_44[,-c(3:20)]

rawdata_44 = rawdata_44[,-c(5:26)]

#Ahora para el programa Vehicle ++++

vehicle44 <- subset(rawdata_44, time >= 2813327518 & time <= 2871879399)

#Graficando los datos crudos de persona 44 en Vehicle

ggplot(vehicle44, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle44_fixations <- subset(detect.fixations(vehicle44))

diagnostic.plot(vehicle44, vehicle44_fixations)

diagnostic.plot(vehicle44, vehicle44_fixations, start.time=2813327518, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle44 <- calculate.summary(vehicle44_fixations)
round(stats_vehicle44, digits=2)

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle44 <- subset(rawdata_44, time >= 2890346227 & time <= 2923192003)


#Graficando los datos crudos de persona 44 en rectangle

ggplot(rectangle44, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle44_fixations <- subset(detect.fixations(rectangle44))

diagnostic.plot(rectangle44, rectangle44_fixations)

diagnostic.plot(rectangle44, rectangle44_fixations, start.time=2890346227, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle44 <- calculate.summary(rectangle44_fixations)
round(stats_rectangle44, digits=2)

