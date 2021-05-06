setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_191 <- read_tsv("191_rawdata.tsv", comment = "#")

rawdata_191 <- rename(rawdata_191, trial = Trial)
rawdata_191 <- rename(rawdata_191, x = 'L POR X [px]')
rawdata_191 <- rename(rawdata_191, y = 'L POR Y [px]')

rawdata_191 <- rawdata_191 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 191

vehicle191 <- subset(rawdata_191, Time >= 483635293 & Time <= 535223247)

vehicle191$time <- seq.int(nrow(vehicle191))*4
vehicle191 = vehicle191[,-c(1)]
write_tsv(vehicle191,"D:/Mario/Escritorio/Fijaciones/vehicle191.tsv")

ggplot(vehicle191, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle191_fixations <- subset(detect.fixations(vehicle191))

diagnostic.plot(vehicle191, vehicle191_fixations)

diagnostic.plot(vehicle191, vehicle191_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle191 <- calculate.summary(vehicle191_fixations)
round(stats_vehicle191, digits=2)



#Hacer rectangle en 191

rectangle191 <- subset(rawdata_191, Time >= 551161683 & Time <= 591250318)

rectangle191$time <- seq.int(nrow(rectangle191))*4
rectangle191 = rectangle191[,-c(1)]
write_tsv(rectangle191,"D:/Mario/Escritorio/Fijaciones/rectangle191.tsv")

ggplot(rectangle191, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle191_fixations <- subset(detect.fixations(rectangle191))

diagnostic.plot(rectangle191, rectangle191_fixations)

diagnostic.plot(rectangle191, rectangle191_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle191 <- calculate.summary(rectangle191_fixations)
round(stats_rectangle191, digits=2)

