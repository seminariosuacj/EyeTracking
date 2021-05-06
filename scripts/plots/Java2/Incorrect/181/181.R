setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_181 <- read_tsv("181_rawdata.tsv", comment = "#")

rawdata_181 <- rename(rawdata_181, trial = Trial)
rawdata_181 <- rename(rawdata_181, x = 'L POR X [px]')
rawdata_181 <- rename(rawdata_181, y = 'L POR Y [px]')

rawdata_181 <- rawdata_181 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 181

rectangle181 <- subset(rawdata_181, Time >= 4486245461 & Time <= 4504436180)

rectangle181$time <- seq.int(nrow(rectangle181))*4
rectangle181 = rectangle181[,-c(1)]
write_tsv(rectangle181,"D:/Mario/Escritorio/Fijaciones/rectangle181.tsv")

ggplot(rectangle181, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle181_fixations <- subset(detect.fixations(rectangle181))

diagnostic.plot(rectangle181, rectangle181_fixations)

diagnostic.plot(rectangle181, rectangle181_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle181 <- calculate.summary(rectangle181_fixations)
round(stats_rectangle181, digits=2)

#Hacer vehicle en 181

vehicle181 <- subset(rawdata_181, Time >= 4519026935 & Time <= 4547497277)

vehicle181$time <- seq.int(nrow(vehicle181))*4
vehicle181 = vehicle181[,-c(1)]
write_tsv(vehicle181,"D:/Mario/Escritorio/Fijaciones/vehicle181.tsv")

ggplot(vehicle181, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle181_fixations <- subset(detect.fixations(vehicle181))

diagnostic.plot(vehicle181, vehicle181_fixations)

diagnostic.plot(vehicle181, vehicle181_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle181 <- calculate.summary(vehicle181_fixations)
round(stats_vehicle181, digits=2)
