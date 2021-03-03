rawdata_167 <- read_tsv("167_rawdata.tsv", comment = "#")

rawdata_167 <- rename(rawdata_167, time = Time)
rawdata_167 <- rename(rawdata_167, trial = Trial)
rawdata_167 <- rename(rawdata_167, x = 'L POR X [px]')
rawdata_167 <- rename(rawdata_167, y = 'L POR Y [px]')

rawdata_167 = rawdata_167[,-c(2)]

rawdata_167 = rawdata_167[,-c(3:20)]

rawdata_167 = rawdata_167[,-c(5:26)]


#Hacer vehicle en 167

vehicle167 <- subset(rawdata_167, time >= 24269567507 & time <= 24313287812)

ggplot(vehicle167, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle167_fixations <- subset(detect.fixations(vehicle167))

diagnostic.plot(vehicle167, vehicle167_fixations)

diagnostic.plot(vehicle167, vehicle167_fixations, start.time=24269567507, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle167 <- calculate.summary(vehicle167_fixations)
round(stats_vehicle167, digits=2)


#Hacer rectangle en 167

rectangle167 <- subset(rawdata_167, time >= 24324330903 & time <= 24349604749)

ggplot(rectangle167, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle167_fixations <- subset(detect.fixations(rectangle167))

diagnostic.plot(rectangle167, rectangle167_fixations)

diagnostic.plot(rectangle167, rectangle167_fixations, start.time=24324330903, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle167 <- calculate.summary(rectangle167_fixations)
round(stats_rectangle167, digits=2)

