setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_34 <- read_tsv("34_rawdata.tsv", comment = "#")

rawdata_34 <- rename(rawdata_34, trial = Trial)
rawdata_34 <- rename(rawdata_34, x = 'L POR X [px]')
rawdata_34 <- rename(rawdata_34, y = 'L POR Y [px]')

rawdata_34 <- rawdata_34 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 34

vehicle34 <- subset(rawdata_34, Time >= 14935905024 & Time <= 15002429686)

vehicle34$time <- seq.int(nrow(vehicle34))*4
vehicle34 = vehicle34[,-c(1)]
write_tsv(vehicle34,"D:/Mario/Escritorio/Fijaciones/vehicle34.tsv")

ggplot(vehicle34, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle34_fixations <- subset(detect.fixations(vehicle34))

diagnostic.plot(vehicle34, vehicle34_fixations)

diagnostic.plot(vehicle34, vehicle34_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle34 <- calculate.summary(vehicle34_fixations)
round(stats_vehicle34, digits=2)



#Hacer rectangle en 34

rectangle34 <- subset(rawdata_34, Time >= 15055479322 & Time <= 15108091699)

rectangle34$time <- seq.int(nrow(rectangle34))*4
rectangle34 = rectangle34[,-c(1)]
write_tsv(rectangle34,"D:/Mario/Escritorio/Fijaciones/rectangle34.tsv")

ggplot(rectangle34, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle34_fixations <- subset(detect.fixations(rectangle34))

diagnostic.plot(rectangle34, rectangle34_fixations)

diagnostic.plot(rectangle34, rectangle34_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle34 <- calculate.summary(rectangle34_fixations)
round(stats_rectangle34, digits=2)

