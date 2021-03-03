rawdata_76 <- read_tsv("76_rawdata.tsv", comment = "#")

rawdata_76 <- rename(rawdata_76, time = Time)
rawdata_76 <- rename(rawdata_76, trial = Trial)
rawdata_76 <- rename(rawdata_76, x = 'L POR X [px]')
rawdata_76 <- rename(rawdata_76, y = 'L POR Y [px]')

rawdata_76 = rawdata_76[,-c(2)]

rawdata_76 = rawdata_76[,-c(3:20)]

rawdata_76 = rawdata_76[,-c(5:26)]

#Hacer rectangle en 76

rectangle76 <- subset(rawdata_76, time >= 191466477 & time <= 253116484)

ggplot(rectangle76, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle76_fixations <- subset(detect.fixations(rectangle76))

diagnostic.plot(rectangle76, rectangle76_fixations)

diagnostic.plot(rectangle76, rectangle76_fixations, start.time=191466477, duration=1000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle76 <- calculate.summary(rectangle76_fixations)
round(stats_rectangle76, digits=2)

#Hacer vehicle en 76

vehicle76 <- subset(rawdata_76, time >= 280974205 & time <= 349552216)

ggplot(vehicle76, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle76_fixations <- subset(detect.fixations(vehicle76))

diagnostic.plot(vehicle76, vehicle76_fixations)

diagnostic.plot(vehicle76, vehicle76_fixations, start.time=280974205, duration=1000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle76 <- calculate.summary(vehicle76_fixations)
round(stats_vehicle76, digits=2)
