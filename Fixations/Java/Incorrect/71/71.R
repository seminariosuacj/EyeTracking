rawdata_71 <- read_tsv("71_rawdata.tsv", comment = "#")

rawdata_71 <- rename(rawdata_71, time = Time)
rawdata_71 <- rename(rawdata_71, trial = Trial)
rawdata_71 <- rename(rawdata_71, x = 'L POR X [px]')
rawdata_71 <- rename(rawdata_71, y = 'L POR Y [px]')

rawdata_71 = rawdata_71[,-c(2)]

rawdata_71 = rawdata_71[,-c(3:20)]

rawdata_71 = rawdata_71[,-c(5:26)]

#Hacer rectangle en 71

rectangle71 <- subset(rawdata_71, time >= 13901910382 & time <= 13972832411)

ggplot(rectangle71, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle71_fixations <- subset(detect.fixations(rectangle71))

diagnostic.plot(rectangle71, rectangle71_fixations)

diagnostic.plot(rectangle71, rectangle71_fixations, start.time=13901910382, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle71 <- calculate.summary(rectangle71_fixations)
round(stats_rectangle71, digits=2)

#Hacer vehicle en 71

vehicle71 <- subset(rawdata_71, time >= 14003013800 & time <= 14128501760)

ggplot(vehicle71, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle71_fixations <- subset(detect.fixations(vehicle71))

diagnostic.plot(vehicle71, vehicle71_fixations)

diagnostic.plot(vehicle71, vehicle71_fixations, start.time=14003013800, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle71 <- calculate.summary(vehicle71_fixations)
round(stats_vehicle71, digits=2)
