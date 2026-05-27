# main.R
# Script principal de ejecución - Proyecto IPM

message("Iniciando la ejecución del flujo de datos IPM...")

# 1. Cargar paquetes necesarios
message("\n--- Ejecutando: 00_paquetes.R ---")
source("R/00_paquetes.R")

# 2. Cargar los microdatos (CSV)
message("\n--- Ejecutando: 01_cargar_datos.R ---")
source("R/01_cargar_datos.R")

# 3. Cruzar las bases de datos (Viviendas + Hogares + Personas)
message("\n--- Ejecutando: 02_cruce_bases.R ---")
source("R/02_cruce_bases.R")

# 4. Validar la calidad de los datos
message("\n--- Ejecutando: 03_validaciones.R ---")
source("R/03_validaciones.R")

# 5. Calcular estimaciones e indicadores IPM
message("\n--- Ejecutando: 04_estimaciones.R ---")
source("R/04_estimaciones.R")

# 6. Ejecutar análisis adicionales
message("\n--- Ejecutando: 05_analisis.R ---")
source("R/05_analisis.R")

# 7. Generar Tablas DANE (con etiquetas aplicadas)
message("\n--- Ejecutando: 07_tablas_dane.R ---")
source("R/07_tablas_dane.R")

# 8. Replicación del Artículo Académico y PCA
message("\n--- Ejecutando: 08_replicacion_articulo.R ---")
source("R/08_replicacion_articulo.R")

message("\n✅ Ejecución finalizada con éxito.")
