rawdata_213 <- read_tsv("213_rawdata.tsv", comment = "#")

rawdata_213 <- rename(rawdata_213, trial = Trial)
rawdata_213 <- rename(rawdata_213, x = 'L POR X [px]')
rawdata_213 <- rename(rawdata_213, y = 'L POR Y [px]')

rawdata_213 <- rawdata_213 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 213

rectangle213 <- subset(rawdata_213, Time >= 15660778335 & Time <= 15699983858)

rectangle213$time <- seq.int(nrow(rectangle213))*4
rectangle213 = rectangle213[,-c(1)]

ggplot(rectangle213, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle213_fixations_save <- subset(detect.fixations(rectangle213), event=="fixation")

rectangle213_fixations_save$participant <- 213

#vamos a guardarlo
write_tsv(rectangle213_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/213.tsv")

