library(dplyr)
library(readr)


setwd("D:/Mario/Escritorio/dataset/emip_dataset")

emip_metadata <- read.csv("emip_metadata.csv")

java1 <- emip_metadata %>%
  filter(stimulus_rectangle == 'rectangle_java.jpg' & stimulus_vehicle == 'vehicle_java.jpg')

#63 personas en total


correct_rectangle <- java1 %>%
  filter(correct_rectangle == '1' & correct_vehicle == '0')
#33 personas bien
#1 6 10 11 18 27 40 45 54 59 62 63 75 81 85 92 100 104 111 113 125 137 faltan 144 160 162 163 169 173 194 198 199 202 209

correct_vehicle <- java1 %>%
  filter(correct_rectangle == '0' & correct_vehicle == '1')
#4 personas
#39 130 131 146


full <- java1 %>%
  filter(correct_rectangle == '1' & correct_vehicle == '1')

#8 personas


noob <- java1 %>%
  filter(correct_rectangle == '0' & correct_vehicle == '0')
# 18
