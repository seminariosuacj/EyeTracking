rawdata_209 <- read_tsv("209_rawdata.tsv", comment = "#")

rawdata_209 <- rename(rawdata_209, trial = Trial)
rawdata_209 <- rename(rawdata_209, x = 'L POR X [px]')
rawdata_209 <- rename(rawdata_209, y = 'L POR Y [px]')

rawdata_209 <- rawdata_209 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 209

rectangle209 <- subset(rawdata_209, Time >= 21463071362 & Time <= 21485385779)

rectangle209$time <- seq.int(nrow(rectangle209))*4
rectangle209 = rectangle209[,-c(1)]

ggplot(rectangle209, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle209_fixations_save <- subset(detect.fixations(rectangle209), event=="fixation")

rectangle209_fixations_save$participant <- 209

#vamos a guardarlo
write_tsv(rectangle209_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/209.tsv")
