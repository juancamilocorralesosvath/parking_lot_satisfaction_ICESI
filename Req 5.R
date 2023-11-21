install.packages("ggplot2") 
library(ggplot2)

subset_data <- subset(survey_data_final, tolower(trimws(jornada)) == "mañana" & tolower(trimws(`encuentra parqueadero`)) == "si")
subset_dataOpposite <- subset(survey_data_final, tolower(trimws(jornada)) == "mañana" & tolower(trimws(`encuentra parqueadero`)) == "no")

num_filas <- nrow(subset_data)
str(num_filas)
#s
opuesto <- nrow(subset_dataOpposite)

datos1 <- data.frame(
  categorias = c("Encuentra parqueadero y es la jornada de la mañana", "No encuentra parqueadero y es la jornada de la mañana"),
  valores = c(num_filas, opuesto)
)

ggplot(datos1, aes(x = categorias, y = valores)) +
  geom_bar(stat = "identity", fill = "skyblue", color = "black") +
  labs(title = "Numero de personas que encuentran parqueadero por la mañana 
       vs Número de personas que no encuentran parqueadero por la mañana",
       x = "Categorías",
       y = "Cantidad de Personas") +
  theme_minimal()
theme(plot.title = element_text(size = 10, hjust = 0.5))

subset_data <- subset(survey_data_final, tolower(trimws(jornada)) == "mañana" & tolower(trimws(`encuentra parqueadero`)) == "no")
subset_dataOpposite <- subset(survey_data_final, tolower(trimws(jornada)) == "tarde" & tolower(trimws(`encuentra parqueadero`)) == "no")
num_filas <- nrow(subset_data)
opuesto <- nrow(subset_dataOpposite)

datos2 <- data.frame(
  categorias = c("No encuentra parqueadero y es la jornada de la mañana", "No encuentra parqueadero y es la jornada de la tarde"),
  valores = c(num_filas, opuesto)
)

# Crear la gráfica de barras con ggplot2
ggplot(datos2, aes(x = categorias, y = valores)) +
  geom_bar(stat = "identity", fill = "skyblue", color = "black") +
  labs(title = "Numero de personas que no encuentran parqueadero por la mañana 
       vs Número de personas que no encuentran parqueadero por la tarde",
       x = "Categorías",
       y = "Cantidad de Personas") +
  theme_minimal()
theme(plot.title = element_text(size = 10, hjust = 0.5))
