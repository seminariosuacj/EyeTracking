setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_137 <- read_tsv("137_rawdata.tsv", comment = "#")

rawdata_137 <- rename(rawdata_137, trial = Trial)
rawdata_137 <- rename(rawdata_137, x = 'L POR X [px]')
rawdata_137 <- rename(rawdata_137, y = 'L POR Y [px]')

rawdata_137 <- rawdata_137 %>%
  select('Time','trial','x','y','L Validity')


#Hacer vehicle en 137

vehicle137 <- subset(rawdata_137, Time >= 6228683077 & Time <= 6270100151)

vehicle137$time <- seq.int(nrow(vehicle137))*4
vehicle137 = vehicle137[,-c(1)]

write_tsv(vehicle137,"D:/Mario/Escritorio/Fijaciones/vehicle137.tsv")

ggplot(vehicle137, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle137_fixations <- subset(detect.fixations(vehicle137))

diagnostic.plot(vehicle137, vehicle137_fixations)

diagnostic.plot(vehicle137, vehicle137_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle137 <- calculate.summary(vehicle137_fixations)
round(stats_vehicle137, digits=2)



#Hacer rectangle en 137

rectangle137 <- subset(rawdata_137, Time >= 6308549468 & Time <= 6334215443)

rectangle137$time <- seq.int(nrow(rectangle137))*4
rectangle137 = rectangle137[,-c(1)]

write_tsv(rectangle137,"D:/Mario/Escritorio/Fijaciones/rectangle137.tsv")

ggplot(rectangle137, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle137_fixations <- subset(detect.fixations(rectangle137))

diagnostic.plot(rectangle137, rectangle137_fixations)

diagnostic.plot(rectangle137, rectangle137_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle137 <- calculate.summary(rectangle137_fixations)
round(stats_rectangle137, digits=2)

