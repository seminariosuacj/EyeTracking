rawdata_51 <- read_tsv("51_rawdata.tsv", comment = "#")

rawdata_51 <- rename(rawdata_51, time = Time)
rawdata_51 <- rename(rawdata_51, trial = Trial)
rawdata_51 <- rename(rawdata_51, x = 'L POR X [px]')
rawdata_51 <- rename(rawdata_51, y = 'L POR Y [px]')

rawdata_51 = rawdata_51[,-c(2)]

rawdata_51 = rawdata_51[,-c(3:20)]

rawdata_51 = rawdata_51[,-c(5:26)]

#Ahora para el programa Vehicle ++++

vehicle51 <- subset(rawdata_51, time >= 4683180469 & time <= 4708438837)

#Graficando los datos crudos de persona 51 en Vehicle

ggplot(vehicle51, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle51_fixations <- subset(detect.fixations(vehicle51))

diagnostic.plot(vehicle51, vehicle51_fixations)

diagnostic.plot(vehicle51, vehicle51_fixations, start.time=4683180469, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle51 <- calculate.summary(vehicle51_fixations)
round(stats_vehicle51, digits=2)



#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle51 <- subset(rawdata_51, time >= 4728253694 & time <= 4754571999)


#Graficando los datos crudos de persona 51 en rectangle

ggplot(rectangle51, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle51_fixations <- subset(detect.fixations(rectangle51))

diagnostic.plot(rectangle51, rectangle51_fixations)

diagnostic.plot(rectangle51, rectangle51_fixations, start.time=4728253694, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle51 <- calculate.summary(rectangle51_fixations)
round(stats_rectangle51, digits=2)

