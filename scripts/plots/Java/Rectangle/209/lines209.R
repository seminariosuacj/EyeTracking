library(Matrix)
library(lme4)
library(ggplot2)
library(eyetrackingR)

library(stats)
library(readr)
library(dplyr)
library(ggplot2)

#1. Cargar dataset y dejar algunas cosas importantes, para despu?s agregar las aoi

setwd("D:/Mario/Escritorio/Scripts/Plots/Java/Rectangle/209")

rectangle_209 <- read_tsv("rectangle209.tsv", comment = "#")

#2. Agregar las AOI
setwd("D:/Mario/Escritorio/dataset/emip_dataset/stimuli")

aoi <- read_csv("rectangle_java.csv", comment = "#")

line_1 = aoi[-c(2:162),]

line_2 = aoi[-c(1,3:162),]

line_3 = aoi[-c(1:2,4:162),]

line_4 = aoi[-c(1:3,5:162),]

line_5 = aoi[-c(1:4,6:162),]

line_6 = aoi[-c(1:5,7:162),]

line_7 = aoi[-c(1:6,8:162),]

line_8 = aoi[-c(1:7,9:162),]

line_9 = aoi[-c(1:8,10:162),]

line_10 = aoi[-c(1:9,11:162),]

line_11 = aoi[-c(1:10,12:162),]

line_12 = aoi[-c(1:11,13:162),]

line_13 = aoi[-c(1:12,14:162),]

line_14 = aoi[-c(1:13,15:162),]

line_15 = aoi[-c(1:14,16:162),]

line_16 = aoi[-c(1:15,17:162),]

line_17 = aoi[-c(1:16,18:162),]

line_18 = aoi[-c(1:17,19:162),]

rectangle_209 <- add_aoi(data = rectangle_209, aoi_dataframe = line_1,
                         x_col = "x", y_col = "y",
                         aoi_name = "line_1",
                         x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

rectangle_209 <- add_aoi(data = rectangle_209, aoi_dataframe = line_2,
                         x_col = "x", y_col = "y",
                         aoi_name = "line_2",
                         x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

rectangle_209 <- add_aoi(data = rectangle_209, aoi_dataframe = line_3,
                         x_col = "x", y_col = "y",
                         aoi_name = "line_3",
                         x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

rectangle_209 <- add_aoi(data = rectangle_209, aoi_dataframe = line_4,
                         x_col = "x", y_col = "y",
                         aoi_name = "line_4",
                         x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

rectangle_209 <- add_aoi(data = rectangle_209, aoi_dataframe = line_5,
                         x_col = "x", y_col = "y",
                         aoi_name = "line_5",
                         x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

rectangle_209 <- add_aoi(data = rectangle_209, aoi_dataframe = line_6,
                         x_col = "x", y_col = "y",
                         aoi_name = "line_6",
                         x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

rectangle_209 <- add_aoi(data = rectangle_209, aoi_dataframe = line_7,
                         x_col = "x", y_col = "y",
                         aoi_name = "line_7",
                         x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

rectangle_209 <- add_aoi(data = rectangle_209, aoi_dataframe = line_8,
                         x_col = "x", y_col = "y",
                         aoi_name = "line_8",
                         x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

rectangle_209 <- add_aoi(data = rectangle_209, aoi_dataframe = line_9,
                         x_col = "x", y_col = "y",
                         aoi_name = "line_9",
                         x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

rectangle_209 <- add_aoi(data = rectangle_209, aoi_dataframe = line_10,
                         x_col = "x", y_col = "y",
                         aoi_name = "line_10",
                         x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

rectangle_209 <- add_aoi(data = rectangle_209, aoi_dataframe = line_11,
                         x_col = "x", y_col = "y",
                         aoi_name = "line_11",
                         x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

rectangle_209 <- add_aoi(data = rectangle_209, aoi_dataframe = line_12,
                         x_col = "x", y_col = "y",
                         aoi_name = "line_12",
                         x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

rectangle_209 <- add_aoi(data = rectangle_209, aoi_dataframe = line_13,
                         x_col = "x", y_col = "y",
                         aoi_name = "line_13",
                         x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

rectangle_209 <- add_aoi(data = rectangle_209, aoi_dataframe = line_14,
                         x_col = "x", y_col = "y",
                         aoi_name = "line_14",
                         x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

rectangle_209 <- add_aoi(data = rectangle_209, aoi_dataframe = line_15,
                         x_col = "x", y_col = "y",
                         aoi_name = "line_15",
                         x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

rectangle_209 <- add_aoi(data = rectangle_209, aoi_dataframe = line_16,
                         x_col = "x", y_col = "y",
                         aoi_name = "line_16",
                         x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

rectangle_209 <- add_aoi(data = rectangle_209, aoi_dataframe = line_17,
                         x_col = "x", y_col = "y",
                         aoi_name = "line_17",
                         x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

rectangle_209 <- add_aoi(data = rectangle_209, aoi_dataframe = line_18,
                         x_col = "x", y_col = "y",
                         aoi_name = "line_18",
                         x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

#Agregar participant_column
rectangle_209 <- mutate(rectangle_209, participant_Id = 'participant209')

#Cambiar los valores para crear TrackLoss
rectangle_209$TrackLoss <- ifelse(rectangle_209$'L Validity' == 0, 1, 0)

#Convertirlo al formato esperado
rectangleparticipant209 <- make_eyetrackingr_data(rectangle_209, 
                                                  participant_column = "participant_Id",
                                                  trial_column = "trial",
                                                  time_column = "time",
                                                  trackloss_column = "TrackLoss",
                                                  aoi_columns = c('line_1', 'line_2', 'line_3', 'line_4', 'line_5',
                                                                  'line_6', 'line_7', 'line_8', 'line_9', 'line_10',
                                                                  'line_11', 'line_12', 'line_13', 'line_14', 'line_15',
                                                                  'line_16', 'line_17', 'line_18'),
                                                  treat_non_aoi_looks_as_missing = TRUE
)


#para ver las apariciones y graficarlas
line1 <- sum(rectangleparticipant209$line_1, na.rm = TRUE)
line2 <- sum(rectangleparticipant209$line_2, na.rm = TRUE)
line3 <- sum(rectangleparticipant209$line_3, na.rm = TRUE)
line4 <- sum(rectangleparticipant209$line_4, na.rm = TRUE)
line5 <- sum(rectangleparticipant209$line_5, na.rm = TRUE)
line6 <- sum(rectangleparticipant209$line_6, na.rm = TRUE)
line7 <- sum(rectangleparticipant209$line_7, na.rm = TRUE)
line8 <- sum(rectangleparticipant209$line_8, na.rm = TRUE)
line9 <- sum(rectangleparticipant209$line_9, na.rm = TRUE)
line10 <- sum(rectangleparticipant209$line_10, na.rm = TRUE)
line11 <- sum(rectangleparticipant209$line_11, na.rm = TRUE)
line12 <- sum(rectangleparticipant209$line_12, na.rm = TRUE)
line13 <- sum(rectangleparticipant209$line_13, na.rm = TRUE)
line14 <- sum(rectangleparticipant209$line_14, na.rm = TRUE)
line15 <- sum(rectangleparticipant209$line_15, na.rm = TRUE)
line16 <- sum(rectangleparticipant209$line_16, na.rm = TRUE)
line17 <- sum(rectangleparticipant209$line_17, na.rm = TRUE)
line18 <- sum(rectangleparticipant209$line_18, na.rm = TRUE)

#Ver las veces que vio en ?reas de inter?s
AOI <- data.frame(
  line = c("line_1", "line_2", "line_3",
           "line_4", "line_5", "line_6",
           "line_7", "line_8", "line_9",
           "line_10", "line_11", "line_12",
           "line_13", "line_14", "line_15",
           "line_16", "line_17", "line_18"),
  number = c(line1, line2, line3,
             line4, line5, line6,
             line7, line8, line9,
             line10, line11, line12,
             line13, line14, line15,
             line16, line17, line18)
)

AOI$line <- factor(AOI$line,
                   levels = c("line_1", "line_2", "line_3",
                              "line_4", "line_5", "line_6",
                              "line_7", "line_8", "line_9",
                              "line_10", "line_11", "line_12",
                              "line_13", "line_14", "line_15",
                              "line_16", "line_17", "line_18"))

participant <- data.frame(
  id = c("participant209"),
  correct = c("1"),
  line1,
  line2,
  line3,
  line4,
  line5,
  line6,
  line7,
  line8,
  line9,
  line10,
  line11,
  line12,
  line13,
  line14,
  line15,
  line16,
  line17,
  line18
)

write_csv(participant,"D:/Mario/Escritorio/bayesian/participant209.csv")

ggplot(AOI, aes(line, number)) +
  geom_col(fill = '#00abff', colour = 'black') +
  labs(x = 'L�nea', y = 'Observaciones') + 
  ggtitle("Rectangle 209") +
  theme_minimal()



#Para vehiculo

setwd("D:/Mario/Escritorio/Scripts/Plots/Java/Rectangle/209")

vehicle_209 <- read_tsv("vehicle209.tsv", comment = "#")

setwd("D:/Mario/Escritorio/dataset/emip_dataset/stimuli")

aoi <- read_csv("vehicle_java.csv", comment = "#")

line_1 = aoi[-c(2:134),]

line_2 = aoi[-c(1,3:134),]

line_3 = aoi[-c(1:2,4:134),]

line_4 = aoi[-c(1:3,5:134),]

line_5 = aoi[-c(1:4,6:134),]

line_6 = aoi[-c(1:5,7:134),]

line_7 = aoi[-c(1:6,8:134),]

line_8 = aoi[-c(1:7,9:134),]

line_9 = aoi[-c(1:8,10:134),]

line_10 = aoi[-c(1:9,11:134),]

line_11 = aoi[-c(1:10,12:134),]

line_12 = aoi[-c(1:11,13:134),]

line_13 = aoi[-c(1:12,14:134),]

line_14 = aoi[-c(1:13,15:134),]

line_15 = aoi[-c(1:14,16:134),]

line_16 = aoi[-c(1:15,17:134),]

line_17 = aoi[-c(1:16,18:134),]

line_18 = aoi[-c(1:17,19:134),]

line_19 = aoi[-c(1:18,20:134),]

line_20 = aoi[-c(1:19,21:134),]

line_21 = aoi[-c(1:20,22:134),]

line_22 = aoi[-c(1:21,23:134),]

vehicle_209 <- add_aoi(data = vehicle_209, aoi_dataframe = line_1,
                       x_col = "x", y_col = "y",
                       aoi_name = "line_1",
                       x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

vehicle_209 <- add_aoi(data = vehicle_209, aoi_dataframe = line_2,
                       x_col = "x", y_col = "y",
                       aoi_name = "line_2",
                       x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

vehicle_209 <- add_aoi(data = vehicle_209, aoi_dataframe = line_3,
                       x_col = "x", y_col = "y",
                       aoi_name = "line_3",
                       x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

vehicle_209 <- add_aoi(data = vehicle_209, aoi_dataframe = line_4,
                       x_col = "x", y_col = "y",
                       aoi_name = "line_4",
                       x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

vehicle_209 <- add_aoi(data = vehicle_209, aoi_dataframe = line_5,
                       x_col = "x", y_col = "y",
                       aoi_name = "line_5",
                       x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

vehicle_209 <- add_aoi(data = vehicle_209, aoi_dataframe = line_6,
                       x_col = "x", y_col = "y",
                       aoi_name = "line_6",
                       x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

vehicle_209 <- add_aoi(data = vehicle_209, aoi_dataframe = line_7,
                       x_col = "x", y_col = "y",
                       aoi_name = "line_7",
                       x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

vehicle_209 <- add_aoi(data = vehicle_209, aoi_dataframe = line_8,
                       x_col = "x", y_col = "y",
                       aoi_name = "line_8",
                       x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

vehicle_209 <- add_aoi(data = vehicle_209, aoi_dataframe = line_9,
                       x_col = "x", y_col = "y",
                       aoi_name = "line_9",
                       x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

vehicle_209 <- add_aoi(data = vehicle_209, aoi_dataframe = line_10,
                       x_col = "x", y_col = "y",
                       aoi_name = "line_10",
                       x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

vehicle_209 <- add_aoi(data = vehicle_209, aoi_dataframe = line_11,
                       x_col = "x", y_col = "y",
                       aoi_name = "line_11",
                       x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

vehicle_209 <- add_aoi(data = vehicle_209, aoi_dataframe = line_12,
                       x_col = "x", y_col = "y",
                       aoi_name = "line_12",
                       x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

vehicle_209 <- add_aoi(data = vehicle_209, aoi_dataframe = line_13,
                       x_col = "x", y_col = "y",
                       aoi_name = "line_13",
                       x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

vehicle_209 <- add_aoi(data = vehicle_209, aoi_dataframe = line_14,
                       x_col = "x", y_col = "y",
                       aoi_name = "line_14",
                       x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

vehicle_209 <- add_aoi(data = vehicle_209, aoi_dataframe = line_15,
                       x_col = "x", y_col = "y",
                       aoi_name = "line_15",
                       x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

vehicle_209 <- add_aoi(data = vehicle_209, aoi_dataframe = line_16,
                       x_col = "x", y_col = "y",
                       aoi_name = "line_16",
                       x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

vehicle_209 <- add_aoi(data = vehicle_209, aoi_dataframe = line_17,
                       x_col = "x", y_col = "y",
                       aoi_name = "line_17",
                       x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

vehicle_209 <- add_aoi(data = vehicle_209, aoi_dataframe = line_18,
                       x_col = "x", y_col = "y",
                       aoi_name = "line_18",
                       x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

vehicle_209 <- add_aoi(data = vehicle_209, aoi_dataframe = line_19,
                       x_col = "x", y_col = "y",
                       aoi_name = "line_19",
                       x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

vehicle_209 <- add_aoi(data = vehicle_209, aoi_dataframe = line_20,
                       x_col = "x", y_col = "y",
                       aoi_name = "line_20",
                       x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

vehicle_209 <- add_aoi(data = vehicle_209, aoi_dataframe = line_21,
                       x_col = "x", y_col = "y",
                       aoi_name = "line_21",
                       x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")

vehicle_209 <- add_aoi(data = vehicle_209, aoi_dataframe = line_22,
                       x_col = "x", y_col = "y",
                       aoi_name = "line_22",
                       x_min_col = "x1", x_max_col = "x2", y_min_col = "y1", y_max_col = "y2")


#Agregar participant_column
vehicle_209 <- mutate(vehicle_209, participant_Id = 'participant209')

#Cambiar los valores para crear TrackLoss
vehicle_209$TrackLoss <- ifelse(vehicle_209$'L Validity' == 0, 1, 0)

#Convertirlo al formato esperado
vehicleparticipant209 <- make_eyetrackingr_data(vehicle_209, 
                                                participant_column = "participant_Id",
                                                trial_column = "trial",
                                                time_column = "time",
                                                trackloss_column = "TrackLoss",
                                                aoi_columns = c('line_1', 'line_2', 'line_3', 'line_4', 'line_5',
                                                                'line_6', 'line_7', 'line_8', 'line_9', 'line_10',
                                                                'line_11', 'line_12', 'line_13', 'line_14', 'line_15',
                                                                'line_16', 'line_17', 'line_18', 'line_19', 'line_20',
                                                                'line_21', 'line_22'),
                                                treat_non_aoi_looks_as_missing = TRUE
)


#para ver las apariciones y graficarlas
l_1 <- sum(vehicleparticipant209$line_1, na.rm = TRUE)
l_2 <- sum(vehicleparticipant209$line_2, na.rm = TRUE)
l_3 <- sum(vehicleparticipant209$line_3, na.rm = TRUE)
l_4 <- sum(vehicleparticipant209$line_4, na.rm = TRUE)
l_5 <- sum(vehicleparticipant209$line_5, na.rm = TRUE)
l_6 <- sum(vehicleparticipant209$line_6, na.rm = TRUE)
l_7 <- sum(vehicleparticipant209$line_7, na.rm = TRUE)
l_8 <- sum(vehicleparticipant209$line_8, na.rm = TRUE)
l_9 <- sum(vehicleparticipant209$line_9, na.rm = TRUE)
l_10 <- sum(vehicleparticipant209$line_10, na.rm = TRUE)
l_11 <- sum(vehicleparticipant209$line_11, na.rm = TRUE)
l_12 <- sum(vehicleparticipant209$line_12, na.rm = TRUE)
l_13 <- sum(vehicleparticipant209$line_13, na.rm = TRUE)
l_14 <- sum(vehicleparticipant209$line_14, na.rm = TRUE)
l_15 <- sum(vehicleparticipant209$line_15, na.rm = TRUE)
l_16 <- sum(vehicleparticipant209$line_16, na.rm = TRUE)
l_17 <- sum(vehicleparticipant209$line_17, na.rm = TRUE)
l_18 <- sum(vehicleparticipant209$line_18, na.rm = TRUE)
l_19 <- sum(vehicleparticipant209$line_19, na.rm = TRUE)
l_20 <- sum(vehicleparticipant209$line_20, na.rm = TRUE)
l_21 <- sum(vehicleparticipant209$line_21, na.rm = TRUE)
l_22 <- sum(vehicleparticipant209$line_22, na.rm = TRUE)

AOI <- data.frame(
  line = c("l_1", "l_2", "l_3",
           "l_4", "l_5", "l_6",
           "l_7", "l_8", "l_9",
           "l_10", "l_11", "l_12",
           "l_13", "l_14", "l_15",
           "l_16", "l_17", "l_18", 
           "l_19", "l_20", "l_21",
           "l_22"),
  number = c(l_1, l_2, l_3,
             l_4, l_5, l_6,
             l_7, l_8, l_9,
             l_10, l_11, l_12,
             l_13, l_14, l_15,
             l_16, l_17, l_18,
             l_19, l_20, l_21,
             l_22)
)

AOI$line <- factor(AOI$line,
                   levels = c("l_1", "l_2", "l_3",
                              "l_4", "l_5", "l_6",
                              "l_7", "l_8", "l_9",
                              "l_10", "l_11", "l_12",
                              "l_13", "l_14", "l_15",
                              "l_16", "l_17", "l_18",
                              "l_19", "l_20", "l_21",
                              "l_22"))

ggplot(AOI, aes(line, number)) +
  geom_col(fill = '#00abff', colour = 'black') +
  labs(x = 'L�nea', y = 'Observaciones') +
  ggtitle("Vehicle 209") +
  theme_minimal()







