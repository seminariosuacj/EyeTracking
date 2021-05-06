library(stats)
library(readr)
library(dplyr)
library(ggplot2)

setwd("D:/Mario/Documents/Eye Movements In Programming/resultados")

vehicle <- read_csv("emipDataFinal.csv")

#¿Qué líneas leyeron más los participantes?
#Crear factores de las líneas para identificar rápidamente

factor(vehicle$line_vehicle)

vehicle$line_vehicle <- factor(vehicle$line_vehicle,
              levels = c("2", "3", "4", "5", "7", "8", "10", "11", "12", "14", "18", "19"))

vehicle %>%
  group_by(line_vehicle) %>%
  summarise(count = n()) %>%
  mutate(percent = count/sum(count)) %>% 
  ggplot(aes(x = line_vehicle, y = count)) +
  geom_col(fill = '#00abff', colour = 'black') +
  geom_text(aes(label = paste0(count)), vjust = -0.15, hjust = 1) +
  geom_text(aes(label = paste0("(", round(100 * percent, 1), "%)")), vjust = -1.22, hjust = 0.6) +
  labs(x = 'Líneas', y = 'Número de observaciones') + 
  theme_minimal() +
  theme(axis.text=element_text(size=14),
        axis.title=element_text(size=14),
        axis.text.x = element_text(size=12, colour = "black"),
        axis.text.y = element_text(size=12, colour = "black")
  )


#¿Qué tipo de líneas leyeron más?
#Aquí ver primero las variables categoricas

factor(vehicle$type_vehicle) #ver los niveles que hay

vehicle$type_vehicle <- factor(vehicle$type_vehicle,
                                   levels = c("if", "constructor", "variable", "functions", "insideIf", "instance", "other", "main"))

vehicle %>%
  group_by(type_vehicle) %>%
  summarise(count = n()) %>%
  mutate(percent = count/sum(count)) %>% 
  ggplot(aes(x = type_vehicle, y = count)) +
  geom_col(fill = '#00abff', colour = 'black') +
  geom_text(aes(label = paste0(count)), vjust = -0.25, hjust = 2) +
  geom_text(aes(label = paste0("(", round(100 * percent, 1), "%)")), vjust = -0.3, hjust = -0.1) +
  labs(x = 'Tipo', y = 'Número de observaciones') + 
  theme_minimal() +
  theme(axis.text=element_text(size=14),
        axis.title=element_text(size=14),
        axis.text.x = element_text(size=12, colour = "black"),
        axis.text.y = element_text(size=12, colour = "black")
  )

#¿De las personas que vieron en if cuántas respondieron correctamente?

ifresults <- vehicle %>%
  filter(type_vehicle == "if")

ifresults %>%
  group_by(correct_vehicle) %>%
  summarise(count = n()) %>%
  mutate(percent = count/sum(count)) %>% 
  ggplot(aes(x = correct_vehicle, y = count)) +
  geom_col(fill = '#00abff', colour = 'black') +
  geom_text(aes(label = paste0(count)), vjust = -0.25, hjust = 2) +
  geom_text(aes(label = paste0("(", round(100 * percent, 1), "%)")), vjust = -0.3, hjust = -.2) +
  labs(x = 'If', y = 'Muestras') + 
  theme_minimal()
  
#¿De las personas que vieron en constructor cuántas respondieron correctamente?

constructor <- vehicle %>%
  filter(type_vehicle == "constructor")

constructor %>%
  group_by(correct_vehicle) %>%
  summarise(count = n()) %>%
  mutate(percent = count/sum(count)) %>% 
  ggplot(aes(x = correct_vehicle, y = count)) +
  geom_col(fill = '#00abff', colour = 'black') +
  geom_text(aes(label = paste0(count)), vjust = -0.25, hjust = 2) +
  geom_text(aes(label = paste0("(", round(100 * percent, 1), "%)")), vjust = -0.3, hjust = -.2) +
  labs(x = 'Constructor', y = 'Muestras') + 
  theme_minimal()


#¿Cuál es el nivel de experiencia de las personas que vieron en el if?

ifresults %>%
  group_by(expertise_experiment_language) %>%
  summarise(count = n()) %>%
  mutate(percent = count/sum(count)) %>% 
  ggplot(aes(x = expertise_experiment_language, y = count)) +
  geom_col(fill = '#00abff', colour = 'black') +
  geom_text(aes(label = paste0(count)), vjust = -0.25, hjust = 2) +
  geom_text(aes(label = paste0("(", round(100 * percent, 1), "%)")), vjust = -0.3, hjust = -.2) +
  labs(x = 'Constructor', y = 'Muestras') + 
  theme_minimal()

#¿Y en el constructor?

constructor %>%
  group_by(expertise_experiment_language) %>%
  summarise(count = n()) %>%
  mutate(percent = count/sum(count)) %>% 
  ggplot(aes(x = expertise_experiment_language, y = count)) +
  geom_col(fill = '#00abff', colour = 'black') +
  geom_text(aes(label = paste0(count)), vjust = -0.25, hjust = 2) +
  geom_text(aes(label = paste0("(", round(100 * percent, 1), "%)")), vjust = -0.3, hjust = -.2) +
  labs(x = 'Constructor', y = 'Muestras') + 
  theme_minimal()

#¿En general cuántas fueron las personas que respondieron bien?

vehicle %>%
  group_by(correct_vehicle) %>%
  summarise(count = n()) %>%
  mutate(percent = count/sum(count)) %>% 
  ggplot(aes(x = correct_vehicle, y = count)) +
  geom_col(fill = '#00abff', colour = 'black') +
  geom_text(aes(label = paste0(count)), vjust = -0.25, hjust = 2) +
  geom_text(aes(label = paste0("(", round(100 * percent, 1), "%)")), vjust = -0.3, hjust = -.2) +
  labs(x = 'Respuestas en general', y = 'Muestras') + 
  theme_minimal()









