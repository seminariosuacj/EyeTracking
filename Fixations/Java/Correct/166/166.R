rawdata_166 <- read_tsv("166_rawdata.tsv", comment = "#")

rawdata_166 <- rename(rawdata_166, time = Time)
rawdata_166 <- rename(rawdata_166, trial = Trial)
rawdata_166 <- rename(rawdata_166, x = 'L POR X [px]')
rawdata_166 <- rename(rawdata_166, y = 'L POR Y [px]')

rawdata_166 = rawdata_166[,-c(2)]

rawdata_166 = rawdata_166[,-c(3:20)]

rawdata_166 = rawdata_166[,-c(5:26)]

#Hacer rectangle en 166

rectangle166 <- subset(rawdata_166, time >= 2564838006 & time <= 2655630416)

ggplot(rectangle166, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle166_fixations <- subset(detect.fixations(rectangle166))

diagnostic.plot(rectangle166, rectangle166_fixations)

diagnostic.plot(rectangle166, rectangle166_fixations, start.time=2564838006, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle166 <- calculate.summary(rectangle166_fixations)
round(stats_rectangle166, digits=2)

#Hacer vehicle en 166

vehicle166 <- subset(rawdata_166, time >= 2718569247 & time <= 2852517680)

ggplot(vehicle166, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle166_fixations <- subset(detect.fixations(vehicle166))

diagnostic.plot(vehicle166, vehicle166_fixations)

diagnostic.plot(vehicle166, vehicle166_fixations, start.time=2718569247, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle166 <- calculate.summary(vehicle166_fixations)
round(stats_vehicle166, digits=2)
