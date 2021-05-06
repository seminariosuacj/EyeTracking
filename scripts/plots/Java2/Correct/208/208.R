setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_208 <- read_tsv("208_rawdata.tsv", comment = "#")

rawdata_208 <- rename(rawdata_208, trial = Trial)
rawdata_208 <- rename(rawdata_208, x = 'L POR X [px]')
rawdata_208 <- rename(rawdata_208, y = 'L POR Y [px]')

rawdata_208 <- rawdata_208 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 208

vehicle208 <- subset(rawdata_208, Time >= 1783760080 & Time <= 1808957803)

vehicle208$time <- seq.int(nrow(vehicle208))*4
vehicle208 = vehicle208[,-c(1)]
write_tsv(vehicle208,"D:/Mario/Escritorio/Fijaciones/vehicle208.tsv")

ggplot(vehicle208, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle208_fixations <- subset(detect.fixations(vehicle208))

diagnostic.plot(vehicle208, vehicle208_fixations)

diagnostic.plot(vehicle208, vehicle208_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle208 <- calculate.summary(vehicle208_fixations)
round(stats_vehicle208, digits=2)


#Hacer rectangle en 208

rectangle208 <- subset(rawdata_208, Time >= 1852554062 & Time <= 1921896318)

rectangle208$time <- seq.int(nrow(rectangle208))*4
rectangle208 = rectangle208[,-c(1)]
write_tsv(rectangle208,"D:/Mario/Escritorio/Fijaciones/rectangle208.tsv")

ggplot(rectangle208, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle208_fixations <- subset(detect.fixations(rectangle208))

diagnostic.plot(rectangle208, rectangle208_fixations)

diagnostic.plot(rectangle208, rectangle208_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle208 <- calculate.summary(rectangle208_fixations)
round(stats_rectangle208, digits=2)

