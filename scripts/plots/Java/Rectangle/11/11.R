setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_11 <- read_tsv("11_rawdata.tsv", comment = "#")

rawdata_11 <- rename(rawdata_11, trial = Trial)
rawdata_11 <- rename(rawdata_11, x = 'L POR X [px]')
rawdata_11 <- rename(rawdata_11, y = 'L POR Y [px]')

rawdata_11 <- rawdata_11 %>%
  select('Time','trial','x','y','L Validity')


#Hacer vehicle11 en 11

vehicle11 <- subset(rawdata_11, Time >= 9497377488 & Time <= 9542725052)

vehicle11$time <- seq.int(nrow(vehicle11))*4
vehicle11 = vehicle11[,-c(1)]

write_tsv(vehicle11,"D:/Mario/Escritorio/Fijaciones/vehicle11.tsv")

ggplot(vehicle11, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle11_fixations <- subset(detect.fixations(vehicle11))

diagnostic.plot(vehicle11, vehicle11_fixations)

diagnostic.plot(vehicle11, vehicle11_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle11 <- calculate.summary(vehicle11_fixations)
round(stats_vehicle11, digits=2)



#Hacer rectangle en 11

rectangle11 <- subset(rawdata_11, Time >= 9556736415 & Time <= 9600044959)

rectangle11$time <- seq.int(nrow(rectangle11))*4
rectangle11 = rectangle11[,-c(1)]

write_tsv(rectangle11,"D:/Mario/Escritorio/Fijaciones/rectangle11.tsv")

ggplot(rectangle11, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle11_fixations <- subset(detect.fixations(rectangle11))

diagnostic.plot(rectangle11, rectangle11_fixations)

diagnostic.plot(rectangle11, rectangle11_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle11 <- calculate.summary(rectangle11_fixations)
round(stats_rectangle11, digits=2)

