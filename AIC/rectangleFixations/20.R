rawdata_20 <- read_tsv("20_rawdata.tsv", comment = "#")

rawdata_20 <- rename(rawdata_20, trial = Trial)
rawdata_20 <- rename(rawdata_20, x = 'L POR X [px]')
rawdata_20 <- rename(rawdata_20, y = 'L POR Y [px]')

rawdata_20 <- rawdata_20 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 20

rectangle20 <- subset(rawdata_20, Time >= 1573577432 & Time <= 1620326339)

rectangle20$time <- seq.int(nrow(rectangle20))*4
rectangle20 = rectangle20[,-c(1)]

ggplot(rectangle20, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)


rectangle20_fixations_save <- subset(detect.fixations(rectangle20), event=="fixation")

rectangle20_fixations_save$participant <- 20

#vamos a guardarlo
write_tsv(rectangle20_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/20.tsv")

