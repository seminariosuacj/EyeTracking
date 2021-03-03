rawdata_98 <- read_tsv("98_rawdata.tsv", comment = "#")

rawdata_98 <- rename(rawdata_98, time = Time)
rawdata_98 <- rename(rawdata_98, trial = Trial)
rawdata_98 <- rename(rawdata_98, x = 'L POR X [px]')
rawdata_98 <- rename(rawdata_98, y = 'L POR Y [px]')

rawdata_98 = rawdata_98[,-c(2)]

rawdata_98 = rawdata_98[,-c(3:20)]

rawdata_98 = rawdata_98[,-c(5:26)]

#Hacer rectangle en 98

rectangle98 <- subset(rawdata_98, time >= 899907738 & time <= 941488648)

ggplot(rectangle98, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle98_fixations <- subset(detect.fixations(rectangle98))

diagnostic.plot(rectangle98, rectangle98_fixations)

diagnostic.plot(rectangle98, rectangle98_fixations, start.time=899907738, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle98 <- calculate.summary(rectangle98_fixations)
round(stats_rectangle98, digits=2)

#Hacer vehicle en 98

vehicle98 <- subset(rawdata_98, time >= 1000560166 & time <= 1034496847)

ggplot(vehicle98, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle98_fixations <- subset(detect.fixations(vehicle98))

diagnostic.plot(vehicle98, vehicle98_fixations)

diagnostic.plot(vehicle98, vehicle98_fixations, start.time=1000560166, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle98 <- calculate.summary(vehicle98_fixations)
round(stats_vehicle98, digits=2)
