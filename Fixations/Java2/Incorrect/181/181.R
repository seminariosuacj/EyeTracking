rawdata_181 <- read_tsv("181_rawdata.tsv", comment = "#")

rawdata_181 <- rename(rawdata_181, time = Time)
rawdata_181 <- rename(rawdata_181, trial = Trial)
rawdata_181 <- rename(rawdata_181, x = 'L POR X [px]')
rawdata_181 <- rename(rawdata_181, y = 'L POR Y [px]')

rawdata_181 = rawdata_181[,-c(2)]

rawdata_181 = rawdata_181[,-c(3:20)]

rawdata_181 = rawdata_181[,-c(5:26)]

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle181 <- subset(rawdata_181, time >= 4486245461 & time <= 4504436180)


#Graficando los datos crudos de persona 181 en rectangle

ggplot(rectangle181, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle181_fixations <- subset(detect.fixations(rectangle181))

diagnostic.plot(rectangle181, rectangle181_fixations)

diagnostic.plot(rectangle181, rectangle181_fixations, start.time=4486245461, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle181 <- calculate.summary(rectangle181_fixations)
round(stats_rectangle181, digits=2)

#Ahora para el programa Vehicle ++++

vehicle181 <- subset(rawdata_181, time >= 4519026935 & time <= 4547497277)

#Graficando los datos crudos de persona 181 en Vehicle

ggplot(vehicle181, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle181_fixations <- subset(detect.fixations(vehicle181))

diagnostic.plot(vehicle181, vehicle181_fixations)

diagnostic.plot(vehicle181, vehicle181_fixations, start.time=4519026935, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle181 <- calculate.summary(vehicle181_fixations)
round(stats_vehicle181, digits=2)
