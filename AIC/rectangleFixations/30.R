rawdata_30 <- read_tsv("30_rawdata.tsv", comment = "#")

rawdata_30 <- rename(rawdata_30, trial = Trial)
rawdata_30 <- rename(rawdata_30, x = 'L POR X [px]')
rawdata_30 <- rename(rawdata_30, y = 'L POR Y [px]')

rawdata_30 <- rawdata_30 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 30

rectangle30 <- subset(rawdata_30, Time >= 653645008 & Time <= 690421958)

rectangle30$time <- seq.int(nrow(rectangle30))*4
rectangle30 = rectangle30[,-c(1)]

ggplot(rectangle30, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle30_fixations_save <- subset(detect.fixations(rectangle30), event=="fixation")

rectangle30_fixations_save$participant <- 30

#vamos a guardarlo
write_tsv(rectangle30_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/30.tsv")
