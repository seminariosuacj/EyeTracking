rawdata_80 <- read_tsv("80_rawdata.tsv", comment = "#")

rawdata_80 <- rename(rawdata_80, time = Time)
rawdata_80 <- rename(rawdata_80, trial = Trial)
rawdata_80 <- rename(rawdata_80, x = 'L POR X [px]')
rawdata_80 <- rename(rawdata_80, y = 'L POR Y [px]')

rawdata_80 = rawdata_80[,-c(2)]

rawdata_80 = rawdata_80[,-c(3:20)]

rawdata_80 = rawdata_80[,-c(5:26)]

#Hacer vehicle en 80

vehicle80 <- subset(rawdata_80, time >= 384552460 & time <= 421832426)

ggplot(vehicle80, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

vehicle80_fixations <- subset(detect.fixations(vehicle80))

diagnostic.plot(vehicle80, vehicle80_fixations)

diagnostic.plot(vehicle80, vehicle80_fixations, start.time=384552460, duration=1000000, interactive=FALSE, ylim=c(0,1000))

stats_vehicle80 <- calculate.summary(vehicle80_fixations)
round(stats_vehicle80, digits=2)

#Hacer rectangle en 80

rectangle80 <- subset(rawdata_80, time >= 442234979 & time <= 474152640)

ggplot(rectangle80, aes(x, y)) +
  geom_point(size=0.2) +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle80_fixations <- subset(detect.fixations(rectangle80))

diagnostic.plot(rectangle80, rectangle80_fixations)

diagnostic.plot(rectangle80, rectangle80_fixations, start.time=442234979, duration=10000000, interactive=FALSE, ylim=c(0,1000))

stats_rectangle80 <- calculate.summary(rectangle80_fixations)
round(stats_rectangle80, digits=2)
