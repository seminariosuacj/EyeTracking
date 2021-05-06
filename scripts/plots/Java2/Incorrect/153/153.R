setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_153 <- read_tsv("153_rawdata.tsv", comment = "#")

rawdata_153 <- rename(rawdata_153, trial = Trial)
rawdata_153 <- rename(rawdata_153, x = 'L POR X [px]')
rawdata_153 <- rename(rawdata_153, y = 'L POR Y [px]')

rawdata_153 <- rawdata_153 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 153

rectangle153 <- subset(rawdata_153, Time >= 2159416918 & Time <= 2192130282)

rectangle153$time <- seq.int(nrow(rectangle153))*4
rectangle153 = rectangle153[,-c(1)]
write_tsv(rectangle153,"D:/Mario/Escritorio/Fijaciones/rectangle153.tsv")

ggplot(rectangle153, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle153_fixations <- subset(detect.fixations(rectangle153))

diagnostic.plot(rectangle153, rectangle153_fixations)

diagnostic.plot(rectangle153, rectangle153_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle153 <- calculate.summary(rectangle153_fixations)
round(stats_rectangle153, digits=2)

#Hacer vehicle en 153

vehicle153 <- subset(rawdata_153, Time >= 2215512259 & Time <= 2281163774)

vehicle153$time <- seq.int(nrow(vehicle153))*4
vehicle153 = vehicle153[,-c(1)]
write_tsv(vehicle153,"D:/Mario/Escritorio/Fijaciones/vehicle153.tsv")

ggplot(vehicle153, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle153_fixations <- subset(detect.fixations(vehicle153))

diagnostic.plot(vehicle153, vehicle153_fixations)

diagnostic.plot(vehicle153, vehicle153_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle153 <- calculate.summary(vehicle153_fixations)
round(stats_vehicle153, digits=2)
