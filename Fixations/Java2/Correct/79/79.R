rawdata_79 <- read_tsv("79_rawdata.tsv", comment = "#")

rawdata_79 <- rename(rawdata_79, time = Time)
rawdata_79 <- rename(rawdata_79, trial = Trial)
rawdata_79 <- rename(rawdata_79, x = 'L POR X [px]')
rawdata_79 <- rename(rawdata_79, y = 'L POR Y [px]')

rawdata_79 = rawdata_79[,-c(2)]

rawdata_79 = rawdata_79[,-c(3:20)]

rawdata_79 = rawdata_79[,-c(5:26)]

#AQUÍ VER EL TIEMPO Y CUÁL PRUEBA FUE PRIMERO

vehicle79 <- subset(rawdata_79, time >= 6494257035 & time <= 6558888736)


#Graficando los datos crudos de persona 79 en vehicle

ggplot(vehicle79, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
vehicle79_fixations <- subset(detect.fixations(vehicle79))

diagnostic.plot(vehicle79, vehicle79_fixations)

diagnostic.plot(vehicle79, vehicle79_fixations, start.time=6494257035, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle79 <- calculate.summary(vehicle79_fixations)
round(stats_vehicle79, digits=2)

#Ahora para el programa rectangle ++++

rectangle79 <- subset(rawdata_79, time >= 6604153455 & time <= 6658693924)

#Graficando los datos crudos de persona 79 en rectangle

ggplot(rectangle79, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

#Utilizando función para crear los datos de importancia
rectangle79_fixations <- subset(detect.fixations(rectangle79))

diagnostic.plot(rectangle79, rectangle79_fixations)

diagnostic.plot(rectangle79, rectangle79_fixations, start.time=6604153455, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle79 <- calculate.summary(rectangle79_fixations)
round(stats_rectangle79, digits=2)
