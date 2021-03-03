rawdata_46 <- read_tsv("46_rawdata.tsv", comment = "#")

rawdata_46 <- rename(rawdata_46, time = Time)
rawdata_46 <- rename(rawdata_46, trial = Trial)
rawdata_46 <- rename(rawdata_46, x = 'L POR X [px]')
rawdata_46 <- rename(rawdata_46, y = 'L POR Y [px]')

rawdata_46 = rawdata_46[,-c(2)]

rawdata_46 = rawdata_46[,-c(3:20)]

rawdata_46 = rawdata_46[,-c(5:26)]

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

vehicle46 <- subset(rawdata_46, time >= 366937746 & time <= 414513061)


#Graficando los datos crudos de persona 46 en rectangle

ggplot(vehicle46, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle46_fixations <- subset(detect.fixations(vehicle46))

diagnostic.plot(vehicle46, vehicle46_fixations)

diagnostic.plot(vehicle46, vehicle46_fixations, start.time=366937746, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle46 <- calculate.summary(vehicle46_fixations)
round(stats_vehicle46, digits=2)

#Ahora para el programa rectangle ++++

rectangle46 <- subset(rawdata_46, time >= 473460893 & time <= 513373929)

#Graficando los datos crudos de persona 46 en Vehicle

ggplot(rectangle46, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle46_fixations <- subset(detect.fixations(rectangle46))

diagnostic.plot(rectangle46, rectangle46_fixations)

diagnostic.plot(rectangle46, rectangle46_fixations, start.time=473460893, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle46 <- calculate.summary(rectangle46_fixations)
round(stats_rectangle46, digits=2)
