setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_200 <- read_tsv("200_rawdata.tsv", comment = "#")

rawdata_200 <- rename(rawdata_200, trial = Trial)
rawdata_200 <- rename(rawdata_200, x = 'L POR X [px]')
rawdata_200 <- rename(rawdata_200, y = 'L POR Y [px]')

rawdata_200 <- rawdata_200 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 200

vehicle200 <- subset(rawdata_200, Time >= 1783310400 & Time <= 1864279521)

vehicle200$time <- seq.int(nrow(vehicle200))*4
vehicle200 = vehicle200[,-c(1)]

write_tsv(vehicle200,"D:/Mario/Escritorio/Fijaciones/vehicle200.tsv")

ggplot(vehicle200, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle200_fixations <- subset(detect.fixations(vehicle200))

diagnostic.plot(vehicle200, vehicle200_fixations)

diagnostic.plot(vehicle200, vehicle200_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle200 <- calculate.summary(vehicle200_fixations)
round(stats_vehicle200, digits=2)

#Hacer rectangle en 200

rectangle200 <- subset(rawdata_200, Time >= 1894984953 & Time <= 2006107422)

rectangle200$time <- seq.int(nrow(rectangle200))*4
rectangle200 = rectangle200[,-c(1)]

write_tsv(rectangle200,"D:/Mario/Escritorio/Fijaciones/rectangle200.tsv")

ggplot(rectangle200, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle200_fixations <- subset(detect.fixations(rectangle200))

diagnostic.plot(rectangle200, rectangle200_fixations)

diagnostic.plot(rectangle200, rectangle200_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle200 <- calculate.summary(rectangle200_fixations)
round(stats_rectangle200, digits=2)

