rawdata_208 <- read_tsv("208_rawdata.tsv", comment = "#")

rawdata_208 <- rename(rawdata_208, time = Time)
rawdata_208 <- rename(rawdata_208, trial = Trial)
rawdata_208 <- rename(rawdata_208, x = 'L POR X [px]')
rawdata_208 <- rename(rawdata_208, y = 'L POR Y [px]')

rawdata_208 = rawdata_208[,-c(2)]

rawdata_208 = rawdata_208[,-c(3:20)]

rawdata_208 = rawdata_208[,-c(5:26)]


#Ahora para el programa Vehicle ++++

vehicle208 <- subset(rawdata_208, time >= 1783760080 & time <= 1808957803)

#Graficando los datos crudos de persona 208 en Vehicle

ggplot(vehicle208, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle208_fixations <- subset(detect.fixations(vehicle208))

diagnostic.plot(vehicle208, vehicle208_fixations)

diagnostic.plot(vehicle208, vehicle208_fixations, start.time=1783760080, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle208 <- calculate.summary(vehicle208_fixations)
round(stats_vehicle208, digits=2)


#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle208 <- subset(rawdata_208, time >= 1852554062 & time <= 1921896318)


#Graficando los datos crudos de persona 208 en rectangle

ggplot(rectangle208, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle208_fixations <- subset(detect.fixations(rectangle208))

diagnostic.plot(rectangle208, rectangle208_fixations)

diagnostic.plot(rectangle208, rectangle208_fixations, start.time=1852554062, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle208 <- calculate.summary(rectangle208_fixations)
round(stats_rectangle208, digits=2)

