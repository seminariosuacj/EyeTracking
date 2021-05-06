rawdata_202 <- read_tsv("202_rawdata.tsv", comment = "#")

rawdata_202 <- rename(rawdata_202, trial = Trial)
rawdata_202 <- rename(rawdata_202, x = 'L POR X [px]')
rawdata_202 <- rename(rawdata_202, y = 'L POR Y [px]')

rawdata_202 <- rawdata_202 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 202

rectangle202 <- subset(rawdata_202, Time >= 1914719188 & Time <= 1969798466)

rectangle202$time <- seq.int(nrow(rectangle202))*4
rectangle202 = rectangle202[,-c(1)]

ggplot(rectangle202, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle202_fixations_save <- subset(detect.fixations(rectangle202), event=="fixation")

rectangle202_fixations_save$participant <- 202

#vamos a guardarlo
write_tsv(rectangle202_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/202.tsv")
