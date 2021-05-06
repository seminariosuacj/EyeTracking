rawdata_193 <- read_tsv("193_rawdata.tsv", comment = "#")

rawdata_193 <- rename(rawdata_193, trial = Trial)
rawdata_193 <- rename(rawdata_193, x = 'L POR X [px]')
rawdata_193 <- rename(rawdata_193, y = 'L POR Y [px]')

rawdata_193 <- rawdata_193 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 193

rectangle193 <- subset(rawdata_193, Time >= 3789843778 & Time <= 3834947244)

rectangle193$time <- seq.int(nrow(rectangle193))*4
rectangle193 = rectangle193[,-c(1)]

ggplot(rectangle193, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle193_fixations_save <- subset(detect.fixations(rectangle193), event=="fixation")

rectangle193_fixations_save$participant <- 193

#vamos a guardarlo
write_tsv(rectangle193_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/193.tsv")
