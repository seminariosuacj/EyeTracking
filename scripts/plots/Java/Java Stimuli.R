#En esta parte del código se enfoca a dividir a las personas que respondieron bien
#Las preguntas planteadas contra las que las respondieron mal

library(stats)

library(readr)
library(dplyr)
library(ggplot2)

library(saccades)

setwd("D:/Mario/Escritorio/dataset/emip_dataset")

emip <- read_csv("emip_metadata.csv")

head(emip)


#Para ello solo se van a seleccionar las personas que hayan realizado las mismas pruebas

program_java <- emip %>%
  filter(stimulus_vehicle == 'vehicle_java.jpg' & stimulus_rectangle == 'rectangle_java.jpg')

#De esto hay que ver cuales son las personas que contestaron correctamente ambas preguntas

javaExperts <- program_java %>%
  filter(correct_vehicle == 1 & correct_rectangle == 1 )
#39 130 131 146

javaNoobs <- program_java %>%
  filter(correct_vehicle == 0 & correct_rectangle == 0 )
#1 6 10 11 18 27 40 45 54 59 62 63 75 81 85 92 100 104 111 113 125 137 144 160 162 163 169 173 194 198 199 202 209

#JAVA1
#Contestaron todo bien 8
#Se equivocaron en todo 18

javaRectangle <- program_java %>%
  filter(correct_vehicle == 0 & correct_rectangle == 1)

#Contestaron bien rectangle 33


javaVehicle <- program_java %>%
  filter(correct_vehicle == 1 & correct_rectangle == 0)
#Contestaron bien vehicle 4


program_java2 <- emip %>%
  filter(stimulus_vehicle == 'vehicle_java2.jpg' & stimulus_rectangle == 'rectangle_java2.jpg')
#144 en java2


javaExperts2 <- program_java2 %>%
  filter(correct_vehicle == 1 & correct_rectangle == 1 )
#24 contestaron todo bien

javaNoobs2 <- program_java2 %>%
  filter(correct_vehicle == 0 & correct_rectangle == 0 )
#28 contestaron todo mal

javaRect2 <- program_java2 %>%
  filter(correct_vehicle == 0 & correct_rectangle == 1 )

#81 contestaron bien rectangle

javaVehicle2 <- program_java2 %>%
  filter(correct_vehicle == 1 & correct_rectangle == 0 )
#11 contestaron bien vehicle
