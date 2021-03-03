rawdata_102 <- read_tsv("102_rawdata.tsv", comment = "#")

rawdata_102 <- rename(rawdata_102, time = Time)
rawdata_102 <- rename(rawdata_102, trial = Trial)
rawdata_102 <- rename(rawdata_102, x = 'L POR X [px]')
rawdata_102 <- rename(rawdata_102, y = 'L POR Y [px]')

rawdata_102 = rawdata_102[,-c(2)]

rawdata_102 = rawdata_102[,-c(3:20)]

rawdata_102 = rawdata_102[,-c(5:26)]



#Hacer vehicle en 102

vehicle102 <- subset(rawdata_102, time >= 11464685085 & time <= 11519154796)

ggplot(vehicle102, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle102_fixations <- subset(detect.fixations(vehicle102))

diagnostic.plot(vehicle102, vehicle102_fixations)

diagnostic.plot(vehicle102, vehicle102_fixations, start.time=11464685085, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle102 <- calculate.summary(vehicle102_fixations)
round(stats_vehicle102, digits=2)


#Hacer rectangle en 102

rectangle102 <- subset(rawdata_102, time >= 11569737388 & time <= 11632493852)

ggplot(rectangle102, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle102_fixations <- subset(detect.fixations(rectangle102))

diagnostic.plot(rectangle102, rectangle102_fixations)

diagnostic.plot(rectangle102, rectangle102_fixations, start.time=11569737388, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle102 <- calculate.summary(rectangle102_fixations)
round(stats_rectangle102, digits=2)

