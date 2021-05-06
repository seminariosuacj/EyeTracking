rawdata_200 <- read_tsv("200_rawdata.tsv", comment = "#")

rawdata_200 <- rename(rawdata_200, trial = Trial)
rawdata_200 <- rename(rawdata_200, x = 'L POR X [px]')
rawdata_200 <- rename(rawdata_200, y = 'L POR Y [px]')

rawdata_200 <- rawdata_200 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 200

rectangle200 <- subset(rawdata_200, Time >= 1894984953 & Time <= 2006107422)

rectangle200$time <- seq.int(nrow(rectangle200))*4
rectangle200 = rectangle200[,-c(1)]

ggplot(rectangle200, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle200_fixations_save <- subset(detect.fixations(rectangle200), event=="fixation")

rectangle200_fixations_save$participant <- 200

#vamos a guardarlo
write_tsv(rectangle200_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/200.tsv")
