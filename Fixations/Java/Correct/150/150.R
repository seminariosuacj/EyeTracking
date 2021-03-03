rawdata_150 <- read_tsv("150_rawdata.tsv", comment = "#")

rawdata_150 <- rename(rawdata_150, time = Time)
rawdata_150 <- rename(rawdata_150, trial = Trial)
rawdata_150 <- rename(rawdata_150, x = 'L POR X [px]')
rawdata_150 <- rename(rawdata_150, y = 'L POR Y [px]')

rawdata_150 = rawdata_150[,-c(2)]

rawdata_150 = rawdata_150[,-c(3:20)]

rawdata_150 = rawdata_150[,-c(5:26)]

#Hacer rectangle en 150

rectangle150 <- subset(rawdata_150, time >= 4014943633 & time <= 4033659245)

ggplot(rectangle150, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle150_fixations <- subset(detect.fixations(rectangle150))

diagnostic.plot(rectangle150, rectangle150_fixations)

diagnostic.plot(rectangle150, rectangle150_fixations, start.time=4014943633, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle150 <- calculate.summary(rectangle150_fixations)
round(stats_rectangle150, digits=2)

#Hacer vehicle en 150

vehicle150 <- subset(rawdata_150, time >= 4064736605 & time <= 4106616964)

ggplot(vehicle150, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle150_fixations <- subset(detect.fixations(vehicle150))

diagnostic.plot(vehicle150, vehicle150_fixations)

diagnostic.plot(vehicle150, vehicle150_fixations, start.time=4064736605, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle150 <- calculate.summary(vehicle150_fixations)
round(stats_vehicle150, digits=2)
