rawdata_199 <- read_tsv("199_rawdata.tsv", comment = "#")

rawdata_199 <- rename(rawdata_199, trial = Trial)
rawdata_199 <- rename(rawdata_199, x = 'L POR X [px]')
rawdata_199 <- rename(rawdata_199, y = 'L POR Y [px]')

rawdata_199 <- rawdata_199 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 199

rectangle199 <- subset(rawdata_199, Time >= 14580671045 & Time <= 14616660687)

rectangle199$time <- seq.int(nrow(rectangle199))*4
rectangle199 = rectangle199[,-c(1)]

ggplot(rectangle199, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle199_fixations_save <- subset(detect.fixations(rectangle199), event=="fixation")

rectangle199_fixations_save$participant <- 199

#vamos a guardarlo
write_tsv(rectangle199_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/199.tsv")
