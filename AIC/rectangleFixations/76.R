rawdata_76 <- read_tsv("76_rawdata.tsv", comment = "#")

rawdata_76 <- rename(rawdata_76, trial = Trial)
rawdata_76 <- rename(rawdata_76, x = 'L POR X [px]')
rawdata_76 <- rename(rawdata_76, y = 'L POR Y [px]')

rawdata_76 <- rawdata_76 %>%
  select('Time','trial','x','y','L Validity')

#Hacer rectangle en 76

rectangle76 <- subset(rawdata_76, Time >= 191466477 & Time <= 253116484)

rectangle76$time <- seq.int(nrow(rectangle76))*4
rectangle76 = rectangle76[,-c(1)]


ggplot(rectangle76, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)


rectangle76_fixations_save <- subset(detect.fixations(rectangle76), event=="fixation")

rectangle76_fixations_save$participant <- 76

#vamos a guardarlo
write_tsv(rectangle76_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/76.tsv")
