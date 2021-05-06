setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_159 <- read_tsv("159_rawdata.tsv", comment = "#")

rawdata_159 <- rename(rawdata_159, trial = Trial)
rawdata_159 <- rename(rawdata_159, x = 'L POR X [px]')
rawdata_159 <- rename(rawdata_159, y = 'L POR Y [px]')

rawdata_159 <- rawdata_159 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 159

vehicle159 <- subset(rawdata_159, Time >= 32439004568 & Time <= 32480201635)

vehicle159$time <- seq.int(nrow(vehicle159))*4
vehicle159 = vehicle159[,-c(1)]
write_tsv(vehicle159,"D:/Mario/Escritorio/Fijaciones/vehicle159.tsv")

ggplot(vehicle159, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle159_fixations <- subset(detect.fixations(vehicle159))

diagnostic.plot(vehicle159, vehicle159_fixations)

diagnostic.plot(vehicle159, vehicle159_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle159 <- calculate.summary(vehicle159_fixations)
round(stats_vehicle159, digits=2)


#Hacer rectangle en 159

rectangle159 <- subset(rawdata_159, Time >= 32507811659 & Time <= 32532182111)

rectangle159$time <- seq.int(nrow(rectangle159))*4
rectangle159 = rectangle159[,-c(1)]
write_tsv(rectangle159,"D:/Mario/Escritorio/Fijaciones/rectangle159.tsv")

ggplot(rectangle159, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle159_fixations <- subset(detect.fixations(rectangle159))

diagnostic.plot(rectangle159, rectangle159_fixations)

diagnostic.plot(rectangle159, rectangle159_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle159 <- calculate.summary(rectangle159_fixations)
round(stats_rectangle159, digits=2)


