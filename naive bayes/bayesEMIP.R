library(tidyverse)
library(tidytext)
library(naivebayes)
library(tm)
library(caret)

setwd("D:/Mario/Documents/Eye Movements In Programming/naive bayes")

emip_df <- na.omit(read_csv("bayesianConstructor.csv"))

#Únicamente líneas de interés

emip_df$id <- NULL

emip_df$line1 <- NULL
emip_df$line4 <- NULL
emip_df$line5 <- NULL
emip_df$line6 <- NULL
emip_df$line8 <- NULL
emip_df$line16 <- NULL
emip_df$line17 <- NULL
emip_df$line18 <- NULL


#Ajuste Naive Bayes----------------
#Crear factores para clasificar si responden bien o mal

ejemplo_matriz <-
  emip_df %>%
  mutate(correct = ifelse(correct == "1", correct, "0"),
         correct = as.factor(correct))


#Sets de entrenamiento y prueba
#sacar el 70% para test y el resto para prueba
ejemplo_entrenamiento <- sample_frac(ejemplo_matriz, .7)
ejemplo_prueba <- setdiff(ejemplo_matriz, ejemplo_entrenamiento)


#Naive bayes
ejemplo_modelo <- naive_bayes(formula = correct ~ .,  data = ejemplo_entrenamiento)

ejemplo_prediccion <- predict(ejemplo_modelo, ejemplo_prueba)

head(ejemplo_prediccion, 25)


#Matriz de confusión para organizar los resultados
confusionMatrix(ejemplo_prediccion, ejemplo_prueba[["correct"]])







