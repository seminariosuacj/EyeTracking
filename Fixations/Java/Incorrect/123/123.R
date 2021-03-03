rawdata_123 <- read_tsv("123_rawdata.tsv", comment = "#")

rawdata_123 <- rename(rawdata_123, time = Time)
rawdata_123 <- rename(rawdata_123, trial = Trial)
rawdata_123 <- rename(rawdata_123, x = 'L POR X [px]')
rawdata_123 <- rename(rawdata_123, y = 'L POR Y [px]')

rawdata_123 = rawdata_123[,-c(2)]

rawdata_123 = rawdata_123[,-c(3:20)]

rawdata_123 = rawdata_123[,-c(5:26)]

#Hacer rectangle en 123

rectangle123 <- subset(rawdata_123, time >= 1842474019 & time <= 1882497336)

ggplot(rectangle123, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle123_fixations <- subset(detect.fixations(rectangle123))

diagnostic.plot(rectangle123, rectangle123_fixations)

diagnostic.plot(rectangle123, rectangle123_fixations, start.time=1842474019, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle123 <- calculate.summary(rectangle123_fixations)
round(stats_rectangle123, digits=2)

#Hacer vehicle en 123

vehicle123 <- subset(rawdata_123, time >= 1920926888 & time <= 1952520624)

ggplot(vehicle123, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle123_fixations <- subset(detect.fixations(vehicle123))

diagnostic.plot(vehicle123, vehicle123_fixations)

diagnostic.plot(vehicle123, vehicle123_fixations, start.time=1920926888, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle123 <- calculate.summary(vehicle123_fixations)
round(stats_vehicle123, digits=2)
