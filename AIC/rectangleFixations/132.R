rawdata_132 <- read_tsv("132_rawdata.tsv", comment = "#")

rawdata_132 <- rename(rawdata_132, trial = Trial)
rawdata_132 <- rename(rawdata_132, x = 'L POR X [px]')
rawdata_132 <- rename(rawdata_132, y = 'L POR Y [px]')

rawdata_132 <- rawdata_132 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 132

rectangle132 <- subset(rawdata_132, Time >= 14617747116 & Time <= 14724192073)

rectangle132$time <- seq.int(nrow(rectangle132))*4
rectangle132 = rectangle132[,-c(1)]

ggplot(rectangle132, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)


rectangle132_fixations_save <- subset(detect.fixations(rectangle132), event=="fixation")

rectangle132_fixations_save$participant <- 132

#vamos a guardarlo
write_tsv(rectangle132_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/132.tsv")
