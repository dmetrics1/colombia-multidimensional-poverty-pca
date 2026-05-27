#!/usr/bin/env Rscript
# Script para compilar el artículo RMD a Word (officedown)
# Uso: source("render_articulo.R") o Rscript render_articulo.R

cat("\n", strrep("=", 60), "\n")
cat("📄 Compilando: articulo_pobreza_multidimensional.Rmd\n")
cat(strrep("=", 60), "\n\n")

# Verificar paquetes necesarios
paquetes_necesarios <- c(
  "rmarkdown", "officedown", "officer", "tidyverse",
  "readxl", "openxlsx", "flextable", "ggplot2", "scales",
  "survey", "srvyr", "FactoMineR", "factoextra", "corrplot", "forcats"
)

cat("✓ Verificando paquetes...\n")
faltantes <- paquetes_necesarios[!paquetes_necesarios %in% installed.packages()[, "Package"]]

if (length(faltantes) > 0) {
  cat("⚠️  Paquetes faltantes:", paste(faltantes, collapse = ", "), "\n")
  cat("   Instalando...\n")
  install.packages(faltantes, dependencies = TRUE, quiet = TRUE)
  cat("   ✓ Instalación completada\n\n")
} else {
  cat("   ✓ Todos los paquetes disponibles\n\n")
}

# Cargar paquetes
invisible(lapply(paquetes_necesarios, library, character.only = TRUE))

# Verificar estructura de archivos
cat("✓ Verificando archivos de entrada...\n")
archivos_esperados <- list(
  Excel = "resultados/Tablas_Articulo_2025.xlsx",
  Bib = "referencias.bib",
  CSL = "apa.csl"
)

for (nombre in names(archivos_esperados)) {
  ruta <- archivos_esperados[[nombre]]
  if (file.exists(ruta)) {
    cat("   ✓", nombre, "encontrado:", ruta, "\n")
  } else {
    cat("   ⚠️", nombre, "NO encontrado:", ruta, "\n")
  }
}

# Verificar gráficos
cat("\n✓ Verificando gráficos generados...\n")
graficos_esperados <- c(
  "Figura_1_Pobreza_Regiones.png",
  "Figura_2_LOE_Regiones.png",
  "Figura_3_EMF_Regiones.png",
  "Figura_4_SUP_Regiones.png",
  "Figura_5_Correlacion_Hogar.png",
  "Figura_6_Correlacion_Personas.png",
  "Figura_7_PCA_Scree.png",
  "Figura_8_PCA_Biplot_POB.png",
  "Figura_9_PCA_Biplot_PER.png",
  "Figura_10_PCA_Biplot_MAY.png"
)

graficos_encontrados <- 0
for (grafico in graficos_esperados) {
  ruta_grafico <- file.path("resultados/graficos_articulo", grafico)
  if (file.exists(ruta_grafico)) {
    cat("   ✓", grafico, "\n")
    graficos_encontrados <- graficos_encontrados + 1
  } else {
    cat("   ⚠️", grafico, "NO encontrado\n")
  }
}

cat("\n   Resumen: ", graficos_encontrados, "/", length(graficos_esperados),
    " gráficos disponibles\n\n", sep = "")

if (graficos_encontrados < length(graficos_esperados)) {
  cat("⚠️  NOTA: Faltan gráficos. El documento se compilará pero mostrará\n")
  cat("   placeholders. Para generar los gráficos, ejecuta antes:\n")
  cat("   source('R/08_replicacion_articulo.R')\n\n")
}

# Compilar documento
cat("🔄 Iniciando compilación...\n")
cat(strrep("-", 60), "\n\n")

tiempo_inicio <- Sys.time()

# Indicar a R la ruta de Pandoc embebida en RStudio/Quarto
Sys.setenv(RSTUDIO_PANDOC = "C:/Program Files/RStudio/resources/app/bin/quarto/bin/tools")

# Eliminar archivo viejo si existe para asegurar frescura
if (file.exists("articulo_pobreza_multidimensional.docx")) {
  file.remove("articulo_pobreza_multidimensional.docx")
}

try({
  rmarkdown::render(
    "articulo_pobreza_multidimensional.Rmd",
    output_format = "officedown::rdocx_document",
    output_file = "articulo_pobreza_multidimensional.docx",
    quiet = FALSE
  )
})

tiempo_fin <- Sys.time()
duracion <- round(as.numeric(difftime(tiempo_fin, tiempo_inicio, units = "secs")), 1)

cat("\n", strrep("-", 60), "\n")
cat("✅ Compilación finalizada en ", duracion, " segundos\n", sep = "")

# Verificar si el documento se generó
if (file.exists("articulo_pobreza_multidimensional.docx")) {
  tamaño_mb <- round(file.size("articulo_pobreza_multidimensional.docx") / (1024^2), 2)
  cat("📊 Documento generado: articulo_pobreza_multidimensional.docx (", tamaño_mb, " MB)\n", sep = "")
  cat("\n✨ ¡Listo para editar en Word!\n")
} else {
  cat("\n❌ ERROR: El documento no fue generado. Revisa los errores arriba.\n")
}

cat("\n", strrep("=", 60), "\n\n")
