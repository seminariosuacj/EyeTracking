setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset/rawdata")

rawdata_111 <- read_tsv("111_rawdata.tsv", comment = "#")

rawdata_111 <- rename(rawdata_111, trial = Trial)
rawdata_111 <- rename(rawdata_111, x = 'L POR X [px]')
rawdata_111 <- rename(rawdata_111, y = 'L POR Y [px]')

rawdata_111 <- rawdata_111 %>%
  select('Time','trial','x','y','L Validity')


#Hacer vehicle en 111

vehicle111 <- subset(rawdata_111, Time >= 11190252937 & Time <= 11232031736)

vehicle111$time <- seq.int(nrow(vehicle111))*4
vehicle111 = vehicle111[,-c(1)]

write_tsv(vehicle111,"D:/Mario/Escritorio/Fijaciones/vehicle111.tsv")

ggplot(vehicle111, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle111_fixations <- subset(detect.fixations(vehicle111))

diagnostic.plot(vehicle111, vehicle111_fixations)

diagnostic.plot(vehicle111, vehicle111_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle111 <- calculate.summary(vehicle111_fixations)
round(stats_vehicle111, digits=2)



#Hacer rectangle en 111

rectangle111 <- subset(rawdata_111, Time >= 11256993883 & Time <= 11302272630)

rectangle111$time <- seq.int(nrow(rectangle111))*4
rectangle111 = rectangle111[,-c(1)]

write_tsv(rectangle111,"D:/Mario/Escritorio/Fijaciones/rectangle111.tsv")

ggplot(rectangle111, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle111_fixations <- subset(detect.fixations(rectangle111))

diagnostic.plot(rectangle111, rectangle111_fixations)

diagnostic.plot(rectangle111, rectangle111_fixations, start.time=4, duration=10000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle111 <- calculate.summary(rectangle111_fixations)
round(stats_rectangle111, digits=2)

