rawdata_93 <- read_tsv("93_rawdata.tsv", comment = "#")

rawdata_93 <- rename(rawdata_93, time = Time)
rawdata_93 <- rename(rawdata_93, trial = Trial)
rawdata_93 <- rename(rawdata_93, x = 'L POR X [px]')
rawdata_93 <- rename(rawdata_93, y = 'L POR Y [px]')

rawdata_93 = rawdata_93[,-c(2)]

rawdata_93 = rawdata_93[,-c(3:20)]

rawdata_93 = rawdata_93[,-c(5:26)]


#Hacer vehicle en 93

vehicle93 <- subset(rawdata_93, time >= 3166903197 & time <= 3185545638)

ggplot(vehicle93, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle93_fixations <- subset(detect.fixations(vehicle93))

diagnostic.plot(vehicle93, vehicle93_fixations)

diagnostic.plot(vehicle93, vehicle93_fixations, start.time=3166903197, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle93 <- calculate.summary(vehicle93_fixations)
round(stats_vehicle93, digits=2)


#Hacer rectangle en 93

rectangle93 <- subset(rawdata_93, time >= 3197268707 & time <= 3216294934)

ggplot(rectangle93, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle93_fixations <- subset(detect.fixations(rectangle93))

diagnostic.plot(rectangle93, rectangle93_fixations)

diagnostic.plot(rectangle93, rectangle93_fixations, start.time=3197268707, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle93 <- calculate.summary(rectangle93_fixations)
round(stats_rectangle93, digits=2)

