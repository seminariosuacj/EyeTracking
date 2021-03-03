rawdata_191 <- read_tsv("191_rawdata.tsv", comment = "#")

rawdata_191 <- rename(rawdata_191, time = Time)
rawdata_191 <- rename(rawdata_191, trial = Trial)
rawdata_191 <- rename(rawdata_191, x = 'L POR X [px]')
rawdata_191 <- rename(rawdata_191, y = 'L POR Y [px]')

rawdata_191 = rawdata_191[,-c(2)]

rawdata_191 = rawdata_191[,-c(3:20)]

rawdata_191 = rawdata_191[,-c(5:26)]

#Ahora para el programa Vehicle ++++

vehicle191 <- subset(rawdata_191, time >= 483635293 & time <= 535223247)

#Graficando los datos crudos de persona 191 en Vehicle

ggplot(vehicle191, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle191_fixations <- subset(detect.fixations(vehicle191))

diagnostic.plot(vehicle191, vehicle191_fixations)

diagnostic.plot(vehicle191, vehicle191_fixations, start.time=483635293, duration=1000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle191 <- calculate.summary(vehicle191_fixations)
round(stats_vehicle191, digits=2)



#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle191 <- subset(rawdata_191, time >= 551161683 & time <= 591250318)


#Graficando los datos crudos de persona 191 en rectangle

ggplot(rectangle191, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle191_fixations <- subset(detect.fixations(rectangle191))

diagnostic.plot(rectangle191, rectangle191_fixations)

diagnostic.plot(rectangle191, rectangle191_fixations, start.time=551161683, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle191 <- calculate.summary(rectangle191_fixations)
round(stats_rectangle191, digits=2)

