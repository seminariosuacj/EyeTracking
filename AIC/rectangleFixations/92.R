rawdata_92 <- read_tsv("92_rawdata.tsv", comment = "#")

rawdata_92 <- rename(rawdata_92, trial = Trial)
rawdata_92 <- rename(rawdata_92, x = 'L POR X [px]')
rawdata_92 <- rename(rawdata_92, y = 'L POR Y [px]')

rawdata_92 <- rawdata_92 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 92

rectangle92 <- subset(rawdata_92, Time >= 1397004238 & Time <= 1438331208)

rectangle92$time <- seq.int(nrow(rectangle92))*4
rectangle92 = rectangle92[,-c(1)]


ggplot(rectangle92, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle92_fixations_save <- subset(detect.fixations(rectangle92), event=="fixation")

rectangle92_fixations_save$participant <- 92

#vamos a guardarlo
write_tsv(rectangle92_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/92.tsv")
