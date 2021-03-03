rawdata_203 <- read_tsv("203_rawdata.tsv", comment = "#")

rawdata_203 <- rename(rawdata_203, time = Time)
rawdata_203 <- rename(rawdata_203, trial = Trial)
rawdata_203 <- rename(rawdata_203, x = 'L POR X [px]')
rawdata_203 <- rename(rawdata_203, y = 'L POR Y [px]')

rawdata_203 = rawdata_203[,-c(2)]

rawdata_203 = rawdata_203[,-c(3:20)]

rawdata_203 = rawdata_203[,-c(5:26)]

#Hacer rectangle en 203

rectangle203 <- subset(rawdata_203, time >= 14806930021 & time <= 14848178467)

ggplot(rectangle203, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle203_fixations <- subset(detect.fixations(rectangle203))

diagnostic.plot(rectangle203, rectangle203_fixations)

diagnostic.plot(rectangle203, rectangle203_fixations, start.time=14806930021, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle203 <- calculate.summary(rectangle203_fixations)
round(stats_rectangle203, digits=2)

#Hacer vehicle en 203

vehicle203 <- subset(rawdata_203, time >= 14871876410 & time <= 14908669172)

ggplot(vehicle203, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle203_fixations <- subset(detect.fixations(vehicle203))

diagnostic.plot(vehicle203, vehicle203_fixations)

diagnostic.plot(vehicle203, vehicle203_fixations, start.time=14871876410, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle203 <- calculate.summary(vehicle203_fixations)
round(stats_vehicle203, digits=2)
