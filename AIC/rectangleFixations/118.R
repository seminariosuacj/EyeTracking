rawdata_118 <- read_tsv("118_rawdata.tsv", comment = "#")

rawdata_118 <- rename(rawdata_118, trial = Trial)
rawdata_118 <- rename(rawdata_118, x = 'L POR X [px]')
rawdata_118 <- rename(rawdata_118, y = 'L POR Y [px]')

rawdata_118 <- rawdata_118 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 118

rectangle118 <- subset(rawdata_118, Time >= 7527215114 & Time <= 7589226731)

rectangle118$time <- seq.int(nrow(rectangle118))*4
rectangle118 = rectangle118[,-c(1)]

ggplot(rectangle118, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle118_fixations_save <- subset(detect.fixations(rectangle118), event=="fixation")

rectangle118_fixations_save$participant <- 118

#vamos a guardarlo
write_tsv(rectangle118_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/118.tsv")

