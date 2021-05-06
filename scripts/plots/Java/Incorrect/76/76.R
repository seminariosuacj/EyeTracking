setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_76 <- read_tsv("76_rawdata.tsv", comment = "#")

rawdata_76 <- rename(rawdata_76, trial = Trial)
rawdata_76 <- rename(rawdata_76, x = 'L POR X [px]')
rawdata_76 <- rename(rawdata_76, y = 'L POR Y [px]')

rawdata_76 <- rawdata_76 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 76

rectangle76 <- subset(rawdata_76, Time >= 191466477 & Time <= 253116484)

rectangle76$time <- seq.int(nrow(rectangle76))*4
rectangle76 = rectangle76[,-c(1)]

write_tsv(rectangle76,"D:/Mario/Escritorio/Fijaciones/rectangle76.tsv")

ggplot(rectangle76, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle76_fixations <- subset(detect.fixations(rectangle76))

diagnostic.plot(rectangle76, rectangle76_fixations)

diagnostic.plot(rectangle76, rectangle76_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle76 <- calculate.summary(rectangle76_fixations)
round(stats_rectangle76, digits=2)

#Hacer vehicle en 76

vehicle76 <- subset(rawdata_76, Time >= 280974205 & Time <= 349552216)

vehicle76$time <- seq.int(nrow(vehicle76))*4
vehicle76 = vehicle76[,-c(1)]

write_tsv(vehicle76,"D:/Mario/Escritorio/Fijaciones/vehicle76.tsv")

ggplot(vehicle76, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle76_fixations <- subset(detect.fixations(vehicle76))

diagnostic.plot(vehicle76, vehicle76_fixations)

diagnostic.plot(vehicle76, vehicle76_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle76 <- calculate.summary(vehicle76_fixations)
round(stats_vehicle76, digits=2)
