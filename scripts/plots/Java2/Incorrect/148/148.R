setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_148 <- read_tsv("148_rawdata.tsv", comment = "#")

rawdata_148 <- rename(rawdata_148, trial = Trial)
rawdata_148 <- rename(rawdata_148, x = 'L POR X [px]')
rawdata_148 <- rename(rawdata_148, y = 'L POR Y [px]')

rawdata_148 <- rawdata_148 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 148

rectangle148 <- subset(rawdata_148, Time >= 597157220 & Time <= 630842592)

rectangle148$time <- seq.int(nrow(rectangle148))*4
rectangle148 = rectangle148[,-c(1)]
write_tsv(rectangle148,"D:/Mario/Escritorio/Fijaciones/rectangle148.tsv")

ggplot(rectangle148, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle148_fixations <- subset(detect.fixations(rectangle148))

diagnostic.plot(rectangle148, rectangle148_fixations)

diagnostic.plot(rectangle148, rectangle148_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle148 <- calculate.summary(rectangle148_fixations)
round(stats_rectangle148, digits=2)

#Hacer vehicle en 148

vehicle148 <- subset(rawdata_148, Time >= 660532059 & Time <= 745976857)

vehicle148$time <- seq.int(nrow(vehicle148))*4
vehicle148 = vehicle148[,-c(1)]
write_tsv(vehicle148,"D:/Mario/Escritorio/Fijaciones/vehicle148.tsv")

ggplot(vehicle148, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle148_fixations <- subset(detect.fixations(vehicle148))

diagnostic.plot(vehicle148, vehicle148_fixations)

diagnostic.plot(vehicle148, vehicle148_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle148 <- calculate.summary(vehicle148_fixations)
round(stats_vehicle148, digits=2)
