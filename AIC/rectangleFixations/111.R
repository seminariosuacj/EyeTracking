rawdata_111 <- read_tsv("111_rawdata.tsv", comment = "#")

rawdata_111 <- rename(rawdata_111, trial = Trial)
rawdata_111 <- rename(rawdata_111, x = 'L POR X [px]')
rawdata_111 <- rename(rawdata_111, y = 'L POR Y [px]')

rawdata_111 <- rawdata_111 %>%
  select('Time','trial','x','y','L Validity')



#Hacer rectangle en 111

rectangle111 <- subset(rawdata_111, Time >= 11256993883 & Time <= 11302272630)

rectangle111$time <- seq.int(nrow(rectangle111))*4
rectangle111 = rectangle111[,-c(1)]

ggplot(rectangle111, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle111_fixations_save <- subset(detect.fixations(rectangle111), event=="fixation")

rectangle111_fixations_save$participant <- 111

#vamos a guardarlo
write_tsv(rectangle111_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/111.tsv")

