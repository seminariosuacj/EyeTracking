#Este archivo es metadatos2
#Probablemente es el que sea utilizado para el final

library(stats)
library(readr)
library(dplyr)
library(ggplot2)

setwd("D:/Mario/Documents/Eye Movements In Programming/emip_dataset")

emip <- read_csv("emip_metadata.csv")

#¿Cuál es el nivel de experiencia de los usuarios en el lenguaje de prueba?

emip$expertise_experiment_language <- factor(emip$expertise_experiment_language,
       levels = c("none", "low", "medium", "high"))

emip %>%
  group_by(expertise_experiment_language) %>%
  summarise(count = n()) %>%
  mutate(percent = count/sum(count)) %>% 
  ggplot(aes(x = expertise_experiment_language, y = count)) +
  geom_col(fill = '#00abff', colour = 'black') +
  geom_text(aes(label = paste0(count)), vjust = -0.25, hjust = 2) +
  geom_text(aes(label = paste0("(", round(100 * percent, 1), "%)")), vjust = -0.3, hjust = -.2) +
  labs(x = 'Nivel', y = 'Muestras') + 
  theme_minimal()

#Personas consideradas nivel alto en el lenguaje de prueba y que respondieron correctamente

eelanguage_correct <- emip %>%
  filter(expertise_experiment_language == 'high' & correct_rectangle == '1' & correct_vehicle == '1')

eprogramming_correct <- emip %>%
  filter(expertise_programming == 'high' & correct_rectangle == '1' & correct_vehicle == '1')


#¿Cuál es el nivel de experiencia de los usuarios en la programación en general?

emip$expertise_programming <- factor(emip$expertise_programming,
      levels = c("none", "low", "medium", "high"))
  
emip %>%
  group_by(expertise_programming) %>%
  summarise(count = n()) %>%
  mutate(percent = count/sum(count)) %>% 
  ggplot(aes(x = expertise_programming, y = count)) +
  geom_col(fill = '#00abff', colour = 'black') +
  geom_text(aes(label = paste0(count)), vjust = -0.25, hjust = 2) +
  geom_text(aes(label = paste0("(", round(100 * percent, 1), "%)")), vjust = -0.3, hjust = -.2) +
  labs(x = 'Nivel', y = 'Muestras') + 
  theme_minimal()


#¿Cuáles fueron los estímulos presentados?
emip %>%
  group_by(stimulus_rectangle) %>%
  summarise(count = n()) %>%
  mutate(percent = count/sum(count)) %>% 
  ggplot(aes(x = stimulus_rectangle, y = count)) +
  geom_col(fill = '#00abff', colour = 'black') +
  geom_text(aes(label = paste0(count)), vjust = -0.25, hjust = 2) +
  geom_text(aes(label = paste0("(", round(100 * percent, 1), "%)")), vjust = -0.3, hjust = -.2) +
  labs(x = 'Orden', y = 'Muestras') + 
  theme_minimal()

#De las personas que realizaron las pruebas con rectangle_java.jpg y vehicle_java.jpg 
java1 <- emip %>%
  filter(stimulus_rectangle == 'rectangle_java.jpg' & stimulus_vehicle == 'vehicle_java.jpg')

correct_java1 <- java1 %>%
  filter(correct_rectangle == 1 & correct_vehicle == 1)

incorrect_java1 <- java1 %>%
  filter(correct_rectangle == 0 & correct_vehicle == 0)


















