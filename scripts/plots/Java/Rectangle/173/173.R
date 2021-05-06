setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_173 <- read_tsv("173_rawdata.tsv", comment = "#")

rawdata_173 <- rename(rawdata_173, trial = Trial)
rawdata_173 <- rename(rawdata_173, x = 'L POR X [px]')
rawdata_173 <- rename(rawdata_173, y = 'L POR Y [px]')

rawdata_173 <- rawdata_173 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 173

rectangle173 <- subset(rawdata_173, Time >= 10020683188 & Time <= 10063946045)

rectangle173$time <- seq.int(nrow(rectangle173))*4
rectangle173 = rectangle173[,-c(1)]

write_tsv(rectangle173,"D:/Mario/Escritorio/Fijaciones/rectangle173.tsv")

ggplot(rectangle173, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle173_fixations <- subset(detect.fixations(rectangle173))

diagnostic.plot(rectangle173, rectangle173_fixations)

diagnostic.plot(rectangle173, rectangle173_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle173 <- calculate.summary(rectangle173_fixations)
round(stats_rectangle173, digits=2)


#Hacer vehicle en 173

vehicle173 <- subset(rawdata_173, Time >= 10118454661 & Time <= 10147640519)

vehicle173$time <- seq.int(nrow(vehicle173))*4
vehicle173 = vehicle173[,-c(1)]

write_tsv(vehicle173,"D:/Mario/Escritorio/Fijaciones/vehicle173.tsv")

ggplot(vehicle173, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle173_fixations <- subset(detect.fixations(vehicle173))

diagnostic.plot(vehicle173, vehicle173_fixations)

diagnostic.plot(vehicle173, vehicle173_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle173 <- calculate.summary(vehicle173_fixations)
round(stats_vehicle173, digits=2)





