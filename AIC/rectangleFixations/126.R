library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

rawdata_126 <- read_tsv("126_rawdata.tsv", comment = "#")

rawdata_126 <- rename(rawdata_126, trial = Trial)
rawdata_126 <- rename(rawdata_126, x = 'L POR X [px]')
rawdata_126 <- rename(rawdata_126, y = 'L POR Y [px]')

rawdata_126 <- rawdata_126 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 126

rectangle126 <- subset(rawdata_126, Time >= 11547675375 & Time <= 11609927286)

rectangle126$time <- seq.int(nrow(rectangle126))*4
rectangle126 = rectangle126[,-c(1)]

ggplot(rectangle126, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle126_fixations_save <- subset(detect.fixations(rectangle126), event=="fixation")

rectangle126_fixations_save$participant <- 126

#vamos a guardarlo
write_tsv(rectangle126_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/126.tsv")




