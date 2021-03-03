rawdata_78 <- read_tsv("78_rawdata.tsv", comment = "#")

rawdata_78 <- rename(rawdata_78, time = Time)
rawdata_78 <- rename(rawdata_78, trial = Trial)
rawdata_78 <- rename(rawdata_78, x = 'L POR X [px]')
rawdata_78 <- rename(rawdata_78, y = 'L POR Y [px]')

rawdata_78 = rawdata_78[,-c(2)]

rawdata_78 = rawdata_78[,-c(3:20)]

rawdata_78 = rawdata_78[,-c(5:26)]

#Ahora para el programa Vehicle ++++

vehicle78 <- subset(rawdata_78, time >= 14193918798 & time <= 14229668381)

#Graficando los datos crudos de persona 78 en Vehicle

ggplot(vehicle78, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle78_fixations <- subset(detect.fixations(vehicle78))

diagnostic.plot(vehicle78, vehicle78_fixations)

diagnostic.plot(vehicle78, vehicle78_fixations, start.time=14193918798, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle78 <- calculate.summary(vehicle78_fixations)
round(stats_vehicle78, digits=2)

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

rectangle78 <- subset(rawdata_78, time >= 14259838541 & time <= 14315330444)


#Graficando los datos crudos de persona 78 en rectangle

ggplot(rectangle78, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle78_fixations <- subset(detect.fixations(rectangle78))

diagnostic.plot(rectangle78, rectangle78_fixations)

diagnostic.plot(rectangle78, rectangle78_fixations, start.time=14259838541, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle78 <- calculate.summary(rectangle78_fixations)
round(stats_rectangle78, digits=2)

