setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_79 <- read_tsv("79_rawdata.tsv", comment = "#")

rawdata_79 <- rename(rawdata_79, trial = Trial)
rawdata_79 <- rename(rawdata_79, x = 'L POR X [px]')
rawdata_79 <- rename(rawdata_79, y = 'L POR Y [px]')

rawdata_79 <- rawdata_79 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 79

vehicle79 <- subset(rawdata_79, Time >= 6494257035 & Time <= 6558888736)

vehicle79$time <- seq.int(nrow(vehicle79))*4
vehicle79 = vehicle79[,-c(1)]
write_tsv(vehicle79,"D:/Mario/Escritorio/Fijaciones/vehicle79.tsv")

ggplot(vehicle79, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle79_fixations <- subset(detect.fixations(vehicle79))

diagnostic.plot(vehicle79, vehicle79_fixations)

diagnostic.plot(vehicle79, vehicle79_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle79 <- calculate.summary(vehicle79_fixations)
round(stats_vehicle79, digits=2)

#Hacer rectangle en 79

rectangle79 <- subset(rawdata_79, Time >= 6604153455 & Time <= 6658693924)

rectangle79$time <- seq.int(nrow(rectangle79))*4
rectangle79 = rectangle79[,-c(1)]
write_tsv(rectangle79,"D:/Mario/Escritorio/Fijaciones/rectangle79.tsv")

ggplot(rectangle79, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle79_fixations <- subset(detect.fixations(rectangle79))

diagnostic.plot(rectangle79, rectangle79_fixations)

diagnostic.plot(rectangle79, rectangle79_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle79 <- calculate.summary(rectangle79_fixations)
round(stats_rectangle79, digits=2)
