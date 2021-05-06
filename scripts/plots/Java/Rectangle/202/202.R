setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_202 <- read_tsv("202_rawdata.tsv", comment = "#")

rawdata_202 <- rename(rawdata_202, trial = Trial)
rawdata_202 <- rename(rawdata_202, x = 'L POR X [px]')
rawdata_202 <- rename(rawdata_202, y = 'L POR Y [px]')

rawdata_202 <- rawdata_202 %>%
  select('Time','trial','x','y','L Validity')


#Hacer vehicle en 202

vehicle202 <- subset(rawdata_202, Time >= 1596139122 & Time <= 1778847552)

vehicle202$time <- seq.int(nrow(vehicle202))*4
vehicle202 = vehicle202[,-c(1)]

write_tsv(vehicle202,"D:/Mario/Escritorio/Fijaciones/vehicle202.tsv")

ggplot(vehicle202, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle202_fixations <- subset(detect.fixations(vehicle202))

diagnostic.plot(vehicle202, vehicle202_fixations)

diagnostic.plot(vehicle202, vehicle202_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle202 <- calculate.summary(vehicle202_fixations)
round(stats_vehicle202, digits=2)



#Hacer rectangle en 202

rectangle202 <- subset(rawdata_202, Time >= 1914719188 & Time <= 1969798466)

rectangle202$time <- seq.int(nrow(rectangle202))*4
rectangle202 = rectangle202[,-c(1)]

write_tsv(rectangle202,"D:/Mario/Escritorio/Fijaciones/rectangle202.tsv")

ggplot(rectangle202, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle202_fixations <- subset(detect.fixations(rectangle202))

diagnostic.plot(rectangle202, rectangle202_fixations)

diagnostic.plot(rectangle202, rectangle202_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle202 <- calculate.summary(rectangle202_fixations)
round(stats_rectangle202, digits=2)

