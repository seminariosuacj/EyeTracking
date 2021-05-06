rawdata_74 <- read_tsv("74_rawdata.tsv", comment = "#")

rawdata_74 <- rename(rawdata_74, trial = Trial)
rawdata_74 <- rename(rawdata_74, x = 'L POR X [px]')
rawdata_74 <- rename(rawdata_74, y = 'L POR Y [px]')

rawdata_74 <- rawdata_74 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 74

rectangle74 <- subset(rawdata_74, Time >= 9706938303 & Time <= 9738559781)

rectangle74$time <- seq.int(nrow(rectangle74))*4
rectangle74 = rectangle74[,-c(1)]

ggplot(rectangle74, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle74_fixations_save <- subset(detect.fixations(rectangle74), event=="fixation")

rectangle74_fixations_save$participant <- 74

#vamos a guardarlo
write_tsv(rectangle74_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/74.tsv")
