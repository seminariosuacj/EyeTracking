setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_213 <- read_tsv("213_rawdata.tsv", comment = "#")

rawdata_213 <- rename(rawdata_213, trial = Trial)
rawdata_213 <- rename(rawdata_213, x = 'L POR X [px]')
rawdata_213 <- rename(rawdata_213, y = 'L POR Y [px]')

rawdata_213 <- rawdata_213 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 213

rectangle213 <- subset(rawdata_213, Time >= 15660778335 & Time <= 15699983858)

rectangle213$time <- seq.int(nrow(rectangle213))*4
rectangle213 = rectangle213[,-c(1)]
write_tsv(rectangle213,"D:/Mario/Escritorio/Fijaciones/rectangle213.tsv")

ggplot(rectangle213, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle213_fixations <- subset(detect.fixations(rectangle213))

diagnostic.plot(rectangle213, rectangle213_fixations)

diagnostic.plot(rectangle213, rectangle213_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle213 <- calculate.summary(rectangle213_fixations)
round(stats_rectangle213, digits=2)

#Hacer vehicle en 213

vehicle213 <- subset(rawdata_213, Time >= 15721854489 & Time <= 15784729746)

vehicle213$time <- seq.int(nrow(vehicle213))*4
vehicle213 = vehicle213[,-c(1)]
write_tsv(vehicle213,"D:/Mario/Escritorio/Fijaciones/vehicle213.tsv")

ggplot(vehicle213, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle213_fixations <- subset(detect.fixations(vehicle213))

diagnostic.plot(vehicle213, vehicle213_fixations)

diagnostic.plot(vehicle213, vehicle213_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle213 <- calculate.summary(vehicle213_fixations)
round(stats_vehicle213, digits=2)
