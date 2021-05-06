rawdata_169 <- read_tsv("169_rawdata.tsv", comment = "#")

rawdata_169 <- rename(rawdata_169, trial = Trial)
rawdata_169 <- rename(rawdata_169, x = 'L POR X [px]')
rawdata_169 <- rename(rawdata_169, y = 'L POR Y [px]')

rawdata_169 <- rawdata_169 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 169

rectangle169 <- subset(rawdata_169, Time >= 2272237696 & Time <= 2359681288)

rectangle169$time <- seq.int(nrow(rectangle169))*4
rectangle169 = rectangle169[,-c(1)]


ggplot(rectangle169, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)


rectangle169_fixations_save <- subset(detect.fixations(rectangle169), event=="fixation")

rectangle169_fixations_save$participant <- 169

#vamos a guardarlo
write_tsv(rectangle169_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/169.tsv")
