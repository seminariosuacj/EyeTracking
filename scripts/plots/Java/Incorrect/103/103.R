setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_103 <- read_tsv("103_rawdata.tsv", comment = "#")

rawdata_103 <- rename(rawdata_103, trial = Trial)
rawdata_103 <- rename(rawdata_103, x = 'L POR X [px]')
rawdata_103 <- rename(rawdata_103, y = 'L POR Y [px]')

rawdata_103 <- rawdata_103 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 103

vehicle103 <- subset(rawdata_103, Time >= 203797947 & Time <= 289208100)

vehicle103$time <- seq.int(nrow(vehicle103))*4
vehicle103 = vehicle103[,-c(1)]

write_tsv(vehicle103,"D:/Mario/Escritorio/Fijaciones/vehicle103.tsv")

ggplot(vehicle103, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle103_fixations <- subset(detect.fixations(vehicle103))

diagnostic.plot(vehicle103, vehicle103_fixations)

diagnostic.plot(vehicle103, vehicle103_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle103 <- calculate.summary(vehicle103_fixations)
round(stats_vehicle103, digits=2)

#Hacer rectangle en 103

rectangle103 <- subset(rawdata_103, Time >= 327064036 & Time <= 374334287)

rectangle103$time <- seq.int(nrow(rectangle103))*4
rectangle103 = rectangle103[,-c(1)]

write_tsv(rectangle103,"D:/Mario/Escritorio/Fijaciones/rectangle103.tsv")

ggplot(rectangle103, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle103_fixations <- subset(detect.fixations(rectangle103))

diagnostic.plot(rectangle103, rectangle103_fixations)

diagnostic.plot(rectangle103, rectangle103_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle103 <- calculate.summary(rectangle103_fixations)
round(stats_rectangle103, digits=2)

