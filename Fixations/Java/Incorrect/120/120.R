rawdata_120 <- read_tsv("120_rawdata.tsv", comment = "#")

rawdata_120 <- rename(rawdata_120, time = Time)
rawdata_120 <- rename(rawdata_120, trial = Trial)
rawdata_120 <- rename(rawdata_120, x = 'L POR X [px]')
rawdata_120 <- rename(rawdata_120, y = 'L POR Y [px]')

rawdata_120 = rawdata_120[,-c(2)]

rawdata_120 = rawdata_120[,-c(3:20)]

rawdata_120 = rawdata_120[,-c(5:26)]

#Hacer rectangle en 120

rectangle120 <- subset(rawdata_120, time >= 9949061430 & time <= 10004440795)

ggplot(rectangle120, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle120_fixations <- subset(detect.fixations(rectangle120))

diagnostic.plot(rectangle120, rectangle120_fixations)

diagnostic.plot(rectangle120, rectangle120_fixations, start.time=9949061430, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle120 <- calculate.summary(rectangle120_fixations)
round(stats_rectangle120, digits=2)

#Hacer vehicle en 120

vehicle120 <- subset(rawdata_120, time >= 10025037544 & time <= 10083928520)

ggplot(vehicle120, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle120_fixations <- subset(detect.fixations(vehicle120))

diagnostic.plot(vehicle120, vehicle120_fixations)

diagnostic.plot(vehicle120, vehicle120_fixations, start.time=10025037544, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle120 <- calculate.summary(vehicle120_fixations)
round(stats_vehicle120, digits=2)
