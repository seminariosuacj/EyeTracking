setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_78 <- read_tsv("78_rawdata.tsv", comment = "#")

rawdata_78 <- rename(rawdata_78, trial = Trial)
rawdata_78 <- rename(rawdata_78, x = 'L POR X [px]')
rawdata_78 <- rename(rawdata_78, y = 'L POR Y [px]')

rawdata_78 <- rawdata_78 %>%
  select('Time','trial','x','y','L Validity')

#Hacer vehicle en 78

vehicle78 <- subset(rawdata_78, Time >= 14193918798 & Time <= 14229668381)

vehicle78$time <- seq.int(nrow(vehicle78))*4
vehicle78 = vehicle78[,-c(1)]
write_tsv(vehicle78,"D:/Mario/Escritorio/Fijaciones/vehicle78.tsv")

ggplot(vehicle78, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle78_fixations <- subset(detect.fixations(vehicle78))

diagnostic.plot(vehicle78, vehicle78_fixations)

diagnostic.plot(vehicle78, vehicle78_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle78 <- calculate.summary(vehicle78_fixations)
round(stats_vehicle78, digits=2)

#Hacer rectangle en 78

rectangle78 <- subset(rawdata_78, Time >= 14259838541 & Time <= 14315330444)

rectangle78$time <- seq.int(nrow(rectangle78))*4
rectangle78 = rectangle78[,-c(1)]
write_tsv(rectangle78,"D:/Mario/Escritorio/Fijaciones/rectangle78.tsv")

ggplot(rectangle78, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle78_fixations <- subset(detect.fixations(rectangle78))

diagnostic.plot(rectangle78, rectangle78_fixations)

diagnostic.plot(rectangle78, rectangle78_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle78 <- calculate.summary(rectangle78_fixations)
round(stats_rectangle78, digits=2)

