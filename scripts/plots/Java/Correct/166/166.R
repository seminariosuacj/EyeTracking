setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_166 <- read_tsv("166_rawdata.tsv", comment = "#")

rawdata_166 <- rename(rawdata_166, trial = Trial)
rawdata_166 <- rename(rawdata_166, x = 'L POR X [px]')
rawdata_166 <- rename(rawdata_166, y = 'L POR Y [px]')

rawdata_166 <- rawdata_166 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 166

rectangle166 <- subset(rawdata_166, Time >= 2564838006 & Time <= 2655630416)

rectangle166$time <- seq.int(nrow(rectangle166))*4
rectangle166 = rectangle166[,-c(1)]

write_tsv(rectangle166,"D:/Mario/Escritorio/Fijaciones/rectangle166.tsv")

ggplot(rectangle166, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle166_fixations <- subset(detect.fixations(rectangle166))

diagnostic.plot(rectangle166, rectangle166_fixations)

diagnostic.plot(rectangle166, rectangle166_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle166 <- calculate.summary(rectangle166_fixations)
round(stats_rectangle166, digits=2)

#Hacer vehicle en 166

vehicle166 <- subset(rawdata_166, Time >= 2718569247 & Time <= 2852517680)

vehicle166$time <- seq.int(nrow(vehicle166))*4
vehicle166 = vehicle166[,-c(1)]

write_tsv(vehicle166,"D:/Mario/Escritorio/Fijaciones/vehicle166.tsv")

ggplot(vehicle166, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle166_fixations <- subset(detect.fixations(vehicle166))

diagnostic.plot(vehicle166, vehicle166_fixations)

diagnostic.plot(vehicle166, vehicle166_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle166 <- calculate.summary(vehicle166_fixations)
round(stats_vehicle166, digits=2)
