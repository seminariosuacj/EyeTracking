setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_209 <- read_tsv("209_rawdata.tsv", comment = "#")

rawdata_209 <- rename(rawdata_209, trial = Trial)
rawdata_209 <- rename(rawdata_209, x = 'L POR X [px]')
rawdata_209 <- rename(rawdata_209, y = 'L POR Y [px]')

rawdata_209 <- rawdata_209 %>%
  select('Time','trial','x','y','L Validity')


#Hacer vehicle en 209

vehicle209 <- subset(rawdata_209, Time >= 21425338461 & Time <= 21441815795)

vehicle209$time <- seq.int(nrow(vehicle209))*4
vehicle209 = vehicle209[,-c(1)]

write_tsv(vehicle209,"D:/Mario/Escritorio/Fijaciones/vehicle209.tsv")

ggplot(vehicle209, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle209_fixations <- subset(detect.fixations(vehicle209))

diagnostic.plot(vehicle209, vehicle209_fixations)

diagnostic.plot(vehicle209, vehicle209_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle209 <- calculate.summary(vehicle209_fixations)
round(stats_vehicle209, digits=2)



#Hacer rectangle en 209

rectangle209 <- subset(rawdata_209, Time >= 21463071362 & Time <= 21485385779)

rectangle209$time <- seq.int(nrow(rectangle209))*4
rectangle209 = rectangle209[,-c(1)]

write_tsv(rectangle209,"D:/Mario/Escritorio/Fijaciones/rectangle209.tsv")

ggplot(rectangle209, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle209_fixations <- subset(detect.fixations(rectangle209))

diagnostic.plot(rectangle209, rectangle209_fixations)

diagnostic.plot(rectangle209, rectangle209_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle209 <- calculate.summary(rectangle209_fixations)
round(stats_rectangle209, digits=2)

