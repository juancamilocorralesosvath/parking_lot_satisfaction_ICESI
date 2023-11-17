surveyData <- read.csv("survey_data.csv", header = TRUE, sep = ",")

class(surveyData)

str(surveyData)

library(dplyr)
library(ggplot2)

surveyData %>% 
  ggplot(aes(x = satisfacción.disponibilidad.espacios)) +
  geom_bar(fill = "royalblue4") +
  labs(y = "frecuencia", x = "satisfacción en la disponibilidad de espacios en el parqueader de la universidad ICESI")+
  theme_minimal()

surveyData %>% 
  ggplot(aes(x = facilidad.acceso)) +
  geom_bar(fill = "royalblue4") +
  labs(y = "frecuencia", x = "satisfacción en la facilidad de acceso a lo espacios de parqueo de la universidad ICESI")+
  theme_minimal()
