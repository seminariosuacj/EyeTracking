setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_134 <- read_tsv("134_rawdata.tsv", comment = "#")

rawdata_134 <- rename(rawdata_134, trial = Trial)
rawdata_134 <- rename(rawdata_134, x = 'L POR X [px]')
rawdata_134 <- rename(rawdata_134, y = 'L POR Y [px]')

rawdata_134 <- rawdata_134 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 134

rectangle134 <- subset(rawdata_134, Time >= 1908567132 & Time <= 1928801254)

rectangle134$time <- seq.int(nrow(rectangle134))*4
rectangle134 = rectangle134[,-c(1)]
write_tsv(rectangle134,"D:/Mario/Escritorio/Fijaciones/rectangle134.tsv")

ggplot(rectangle134, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle134_fixations <- subset(detect.fixations(rectangle134))

diagnostic.plot(rectangle134, rectangle134_fixations)

diagnostic.plot(rectangle134, rectangle134_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle134 <- calculate.summary(rectangle134_fixations)
round(stats_rectangle134, digits=2)

#Hacer vehicle en 134

vehicle134 <- subset(rawdata_134, Time >= 1938716426 & Time <= 1950495268)

vehicle134$time <- seq.int(nrow(vehicle134))*4
vehicle134 = vehicle134[,-c(1)]
write_tsv(vehicle134,"D:/Mario/Escritorio/Fijaciones/vehicle134.tsv")

ggplot(vehicle134, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle134_fixations <- subset(detect.fixations(vehicle134))

diagnostic.plot(vehicle134, vehicle134_fixations)

diagnostic.plot(vehicle134, vehicle134_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle134 <- calculate.summary(vehicle134_fixations)
round(stats_vehicle134, digits=2)
