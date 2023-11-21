install.packages("ggplot2") 
library(ggplot2)
subset_data <- subset(survey_data_final, tolower(trimws(jornada)) == "mañana" & tolower(trimws(`encuentra parqueadero`)) == "si")
subset_dataOpposite <- subset(survey_data_final, tolower(trimws(jornada)) == "mañana" & tolower(trimws(`encuentra parqueadero`)) == "no")

num_filas <- nrow(subset_data)
str(num_filas)
#save
opuesto <- nrow(subset_dataOpposite)

datos1 <- data.frame(
  categorias = c("Encuentra parqueadero dado que es la jornada de la mañana", "No encuentra parqueadero dado es la jornada de la mañana"),
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

num_mañana <- nrow(subset(survey_data_final, tolower(trimws(jornada)) == "mañana"))/99
print(paste(num_mañana," es la probabilidad de llegar al aprqueadero por la tarde"))

num_tarde <- nrow(subset(survey_data_final, tolower(trimws(jornada)) == "tarde"))/99
print(paste(num_tarde," es la probabilidad de llegar al aprqueadero por la tarde"))


prob_condicional_mañana <- (num_filas/99)/num_mañana
prob_condicional_tarde <- (opuesto/99)/num_tarde

datos2 <- data.frame(
  categorias = c("No encuentra parqueadero dado que es la jornada de la mañana", "No encuentra parqueadero dado es la jornada de la tarde"),
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

