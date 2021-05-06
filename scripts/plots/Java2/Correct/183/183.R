setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_183 <- read_tsv("183_rawdata.tsv", comment = "#")

rawdata_183 <- rename(rawdata_183, trial = Trial)
rawdata_183 <- rename(rawdata_183, x = 'L POR X [px]')
rawdata_183 <- rename(rawdata_183, y = 'L POR Y [px]')

rawdata_183 <- rawdata_183 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 183

vehicle183 <- subset(rawdata_183, Time >= 436609120 & Time <= 528709565)

vehicle183$time <- seq.int(nrow(vehicle183))*4
vehicle183 = vehicle183[,-c(1)]
write_tsv(vehicle183,"D:/Mario/Escritorio/Fijaciones/vehicle183.tsv")

ggplot(vehicle183, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle183_fixations <- subset(detect.fixations(vehicle183))

diagnostic.plot(vehicle183, vehicle183_fixations)

diagnostic.plot(vehicle183, vehicle183_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle183 <- calculate.summary(vehicle183_fixations)
round(stats_vehicle183, digits=2)

#Hacer rectangle en 180

rectangle183 <- subset(rawdata_183, Time >= 549279625 & Time <= 659340839)

rectangle183$time <- seq.int(nrow(rectangle183))*4
rectangle183 = rectangle183[,-c(1)]
write_tsv(rectangle183,"D:/Mario/Escritorio/Fijaciones/rectangle183.tsv")

ggplot(rectangle183, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle183_fixations <- subset(detect.fixations(rectangle183))

diagnostic.plot(rectangle183, rectangle183_fixations)

diagnostic.plot(rectangle183, rectangle183_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle183 <- calculate.summary(rectangle183_fixations)
round(stats_rectangle183, digits=2)

