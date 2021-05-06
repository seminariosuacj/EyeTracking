rawdata_93 <- read_tsv("93_rawdata.tsv", comment = "#")

rawdata_93 <- rename(rawdata_93, trial = Trial)
rawdata_93 <- rename(rawdata_93, x = 'L POR X [px]')
rawdata_93 <- rename(rawdata_93, y = 'L POR Y [px]')

rawdata_93 <- rawdata_93 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 93

rectangle93 <- subset(rawdata_93, Time >= 3197268707 & Time <= 3216294934)

rectangle93$time <- seq.int(nrow(rectangle93))*4
rectangle93 = rectangle93[,-c(1)]


ggplot(rectangle93, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)


rectangle93_fixations_save <- subset(detect.fixations(rectangle93), event=="fixation")

rectangle93_fixations_save$participant <- 93

#vamos a guardarlo
write_tsv(rectangle93_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/93.tsv")
