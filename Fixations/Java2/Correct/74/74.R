rawdata_74 <- read_tsv("74_rawdata.tsv", comment = "#")

rawdata_74 <- rename(rawdata_74, time = Time)
rawdata_74 <- rename(rawdata_74, trial = Trial)
rawdata_74 <- rename(rawdata_74, x = 'L POR X [px]')
rawdata_74 <- rename(rawdata_74, y = 'L POR Y [px]')

rawdata_74 = rawdata_74[,-c(2)]

rawdata_74 = rawdata_74[,-c(3:20)]

rawdata_74 = rawdata_74[,-c(5:26)]

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle74 <- subset(rawdata_74, time >= 9706938303 & time <= 9738559781)


#Graficando los datos crudos de persona 74 en rectangle

ggplot(rectangle74, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle74_fixations <- subset(detect.fixations(rectangle74))

diagnostic.plot(rectangle74, rectangle74_fixations)

diagnostic.plot(rectangle74, rectangle74_fixations, start.time=9706938303, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle74 <- calculate.summary(rectangle74_fixations)
round(stats_rectangle74, digits=2)

#Ahora para el programa Vehicle ++++

vehicle74 <- subset(rawdata_74, time >= 9754406569 & time <= 9782380762)

#Graficando los datos crudos de persona 74 en Vehicle

ggplot(vehicle74, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed()+
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle74_fixations <- subset(detect.fixations(vehicle74))

diagnostic.plot(vehicle74, vehicle74_fixations)

diagnostic.plot(vehicle74, vehicle74_fixations, start.time=9754406569, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle74 <- calculate.summary(vehicle74_fixations)
round(stats_vehicle74, digits=2)
