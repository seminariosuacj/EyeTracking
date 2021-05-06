library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

rawdata_124 <- read_tsv("124_rawdata.tsv", comment = "#")

rawdata_124 <- rename(rawdata_124, trial = Trial)
rawdata_124 <- rename(rawdata_124, x = 'L POR X [px]')
rawdata_124 <- rename(rawdata_124, y = 'L POR Y [px]')

rawdata_124 <- rawdata_124 %>%
  select('Time','trial','x','y','L Validity')


#Hacer rectangle en 124

rectangle124 <- subset(rawdata_124, Time >= 345948695 & Time <= 446866346)

rectangle124$time <- seq.int(nrow(rectangle124))*4
rectangle124 = rectangle124[,-c(1)]

ggplot(rectangle124, aes(x, y)) +
  geom_point(alpha = 0.4, color = "blue") +
  coord_fixed() +
  expand_limits(x = 1920, y = 1080)

rectangle124_fixations_save <- subset(detect.fixations(rectangle124), event=="fixation")

rectangle124_fixations_save$participant <- 124

#vamos a guardarlo
write_tsv(rectangle124_fixations_save,"D:/Mario/Escritorio/datasets/rectangleconsDATA/124.tsv")



