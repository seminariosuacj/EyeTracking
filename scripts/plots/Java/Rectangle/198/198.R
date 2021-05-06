setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_198 <- read_tsv("198_rawdata.tsv", comment = "#")

rawdata_198 <- rename(rawdata_198, trial = Trial)
rawdata_198 <- rename(rawdata_198, x = 'L POR X [px]')
rawdata_198 <- rename(rawdata_198, y = 'L POR Y [px]')

rawdata_198 <- rawdata_198 %>%
  select('Time','trial','x','y','L Validity')


#Hacer vehicle en 198

vehicle198 <- subset(rawdata_198, Time >= 3243123564 & Time <= 3278332516)

vehicle198$time <- seq.int(nrow(vehicle198))*4
vehicle198 = vehicle198[,-c(1)]

write_tsv(vehicle198,"D:/Mario/Escritorio/Fijaciones/vehicle198.tsv")

ggplot(vehicle198, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle198_fixations <- subset(detect.fixations(vehicle198))

diagnostic.plot(vehicle198, vehicle198_fixations)

diagnostic.plot(vehicle198, vehicle198_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle198 <- calculate.summary(vehicle198_fixations)
round(stats_vehicle198, digits=2)



#Hacer rectangle en 198

rectangle198 <- subset(rawdata_198, Time >= 3298867127 & Time <= 3341339198)

rectangle198$time <- seq.int(nrow(rectangle198))*4
rectangle198 = rectangle198[,-c(1)]

write_tsv(rectangle198,"D:/Mario/Escritorio/Fijaciones/rectangle198.tsv")

ggplot(rectangle198, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle198_fixations <- subset(detect.fixations(rectangle198))

diagnostic.plot(rectangle198, rectangle198_fixations)

diagnostic.plot(rectangle198, rectangle198_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle198 <- calculate.summary(rectangle198_fixations)
round(stats_rectangle198, digits=2)

