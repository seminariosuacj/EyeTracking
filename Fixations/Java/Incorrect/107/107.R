rawdata_107 <- read_tsv("107_rawdata.tsv", comment = "#")

rawdata_107 <- rename(rawdata_107, time = Time)
rawdata_107 <- rename(rawdata_107, trial = Trial)
rawdata_107 <- rename(rawdata_107, x = 'L POR X [px]')
rawdata_107 <- rename(rawdata_107, y = 'L POR Y [px]')

rawdata_107 = rawdata_107[,-c(2)]

rawdata_107 = rawdata_107[,-c(3:20)]

rawdata_107 = rawdata_107[,-c(5:26)]

#Hacer rectangle en 107

rectangle107 <- subset(rawdata_107, time >= 1168783867 & time <= 1231378586)

ggplot(rectangle107, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle107_fixations <- subset(detect.fixations(rectangle107))

diagnostic.plot(rectangle107, rectangle107_fixations)

diagnostic.plot(rectangle107, rectangle107_fixations, start.time=1168783867, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle107 <- calculate.summary(rectangle107_fixations)
round(stats_rectangle107, digits=2)

#Hacer vehicle en 107

vehicle107 <- subset(rawdata_107, time >= 1269304753 & time <= 1295872302)

ggplot(vehicle107, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle107_fixations <- subset(detect.fixations(vehicle107))

diagnostic.plot(vehicle107, vehicle107_fixations)

diagnostic.plot(vehicle107, vehicle107_fixations, start.time=1269304753, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle107 <- calculate.summary(vehicle107_fixations)
round(stats_vehicle107, digits=2)
