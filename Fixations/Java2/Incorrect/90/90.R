rawdata_90 <- read_tsv("90_rawdata.tsv", comment = "#")

rawdata_90 <- rename(rawdata_90, time = Time)
rawdata_90 <- rename(rawdata_90, trial = Trial)
rawdata_90 <- rename(rawdata_90, x = 'L POR X [px]')
rawdata_90 <- rename(rawdata_90, y = 'L POR Y [px]')

rawdata_90 = rawdata_90[,-c(2)]

rawdata_90 = rawdata_90[,-c(3:20)]

rawdata_90 = rawdata_90[,-c(5:26)]



#Ahora para el programa Vehicle ++++

vehicle90 <- subset(rawdata_90, time >= 3754030527 & time <= 3761449972)

#Graficando los datos crudos de persona 90 en Vehicle

ggplot(vehicle90, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle90_fixations <- subset(detect.fixations(vehicle90))

diagnostic.plot(vehicle90, vehicle90_fixations)

diagnostic.plot(vehicle90, vehicle90_fixations, start.time=3754030527, duration=1000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle90 <- calculate.summary(vehicle90_fixations)
round(stats_vehicle90, digits=2)




#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle90 <- subset(rawdata_90, time >= 3777447485 & time <= 3804713953)


#Graficando los datos crudos de persona 90 en rectangle

ggplot(rectangle90, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle90_fixations <- subset(detect.fixations(rectangle90))

diagnostic.plot(rectangle90, rectangle90_fixations)

diagnostic.plot(rectangle90, rectangle90_fixations, start.time=3777447485, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle90 <- calculate.summary(rectangle90_fixations)
round(stats_rectangle90, digits=2)

