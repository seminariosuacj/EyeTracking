setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_192 <- read_tsv("192_rawdata.tsv", comment = "#")

rawdata_192 <- rename(rawdata_192, trial = Trial)
rawdata_192 <- rename(rawdata_192, x = 'L POR X [px]')
rawdata_192 <- rename(rawdata_192, y = 'L POR Y [px]')

rawdata_192 <- rawdata_192 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 192

rectangle192 <- subset(rawdata_192, Time >= 8333322962 & Time <= 8422037319)

rectangle192$time <- seq.int(nrow(rectangle192))*4
rectangle192 = rectangle192[,-c(1)]

write_tsv(rectangle192,"D:/Mario/Escritorio/Fijaciones/rectangle192.tsv")

ggplot(rectangle192, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle192_fixations <- subset(detect.fixations(rectangle192))

diagnostic.plot(rectangle192, rectangle192_fixations)

diagnostic.plot(rectangle192, rectangle192_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle192 <- calculate.summary(rectangle192_fixations)
round(stats_rectangle192, digits=2)

#Hacer vehicle en 192

vehicle192 <- subset(rawdata_192, Time >= 8460428246 & Time <= 8503950733)

vehicle192$time <- seq.int(nrow(vehicle192))*4
vehicle192 = vehicle192[,-c(1)]

write_tsv(vehicle192,"D:/Mario/Escritorio/Fijaciones/vehicle192.tsv")

ggplot(vehicle192, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle192_fixations <- subset(detect.fixations(vehicle192))

diagnostic.plot(vehicle192, vehicle192_fixations)

diagnostic.plot(vehicle192, vehicle192_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle192 <- calculate.summary(vehicle192_fixations)
round(stats_vehicle192, digits=2)
