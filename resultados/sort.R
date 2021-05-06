library(stats)
library(readr)
library(dplyr)
library(ggplot2)

emipData

newdata <- rectangleFINAL[order(rectangleFINAL$id),]

#Creación dataset

emipData <- bind_cols(emipData, newdata['line_rectangle'])
emipData <- bind_cols(emipData, newdata['type_rectangle'])

#Reordenar
newdata2 <- vehicleFINAL[order(vehicleFINAL$id),]

rm(emipData)

emipData <- bind_cols(emipData, newdata2['line_vehicle'])
emipData <- bind_cols(emipData, newdata2['type_vehicle'])

write_csv(emipData,"D:/Mario/Escritorio/emipDataFinal.csv")






