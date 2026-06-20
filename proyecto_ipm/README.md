# Proyecto IPM 2025: Pobreza Multidimensional en Colombia

Este proyecto contiene un pipeline analitico en R para cargar, cruzar, validar, estimar y documentar resultados del Indice de Pobreza Multidimensional (IPM) en Colombia con microdatos DANE 2025.

El trabajo tiene dos objetivos principales:

1. Calcular y auditar metricas del IPM 2025 a partir de bases nacional y departamental.
2. Replicar y actualizar el enfoque del articulo "Perspectiva multidimensional de la pobreza en los hogares colombianos", incluyendo analisis descriptivo, correlaciones y Analisis de Componentes Principales (PCA).

## Componentes

- Pipeline modular en R disponible en `R/`.
- Bases procesadas en `datos/procesados/`.
- Tablas finales en `resultados/` y 10 figuras en `resultados/graficos_articulo/`.
- Reporte interactivo de portafolio: `informe_ipm_portafolio_premium.html`.
- Figuras del artículo replicado generadas por `R/08_replicacion_articulo.R`.

## Estructura del Proyecto

```text
proyecto_ipm/
|
|-- datos/
|   |-- raw/                  # CSV usados por el pipeline
|   `-- procesados/           # Bases .rds generadas por los scripts
|
|-- diccionario/              # Diccionario oficial DANE en Excel y version limpia en Markdown
|-- metodologia/              # Documentos metodologicos del IPM
|-- reportes_dane/            # Boletines oficiales DANE usados como contraste
|
|-- R/
|   |-- 00_paquetes.R
|   |-- 01_cargar_datos.R
|   |-- 02_cruce_bases.R
|   |-- 03_validaciones.R
|   |-- 04_estimaciones.R
|   |-- 05_analisis.R
|   |-- 06_etiquetas_diccionario.R
|   |-- 07_tablas_dane.R
|   `-- 08_replicacion_articulo.R
|
|-- resultados/
|   |-- graficos_articulo/    # Figuras 1 a 10 en PNG
|   |-- tablas/               # Resultados_IPM_2025.xlsx
|   `-- Tablas_Articulo_2025.xlsx
|
|-- main.R
|-- informe_ipm_portafolio.qmd
|-- informe_ipm_portafolio_premium.html
`-- referencias.bib
```

## Flujo de Ejecucion

Desde RStudio, ubicarse en la carpeta `proyecto_ipm` y ejecutar:

```r
source("main.R")
```

El orquestador corre los scripts en este orden:

```r
source("R/00_paquetes.R")
source("R/01_cargar_datos.R")
source("R/02_cruce_bases.R")
source("R/03_validaciones.R")
source("R/04_estimaciones.R")
source("R/05_analisis.R")
source("R/07_tablas_dane.R")
source("R/08_replicacion_articulo.R")
```

## Salidas Principales

- `datos/procesados/base_nacional.rds`
- `datos/procesados/base_departamental.rds`
- `datos/procesados/base_personas_nacional.rds`
- `datos/procesados/base_personas_departamental.rds`
- `datos/procesados/dataset_articulo_2025.rds`
- `resultados/tablas/Resultados_IPM_2025.xlsx`
- `resultados/Tablas_Articulo_2025.xlsx`
- `resultados/graficos_articulo/Figura_1_Pobreza_Regiones.png`
- `resultados/graficos_articulo/Figura_2_LOE_Regiones.png`
- `resultados/graficos_articulo/Figura_3_EMF_Regiones.png`
- `resultados/graficos_articulo/Figura_4_SUP_Regiones.png`
- `resultados/graficos_articulo/Figura_5_Correlacion_Hogar.png`
- `resultados/graficos_articulo/Figura_6_Correlacion_Personas.png`
- `resultados/graficos_articulo/Figura_7_PCA_Scree.png`
- `resultados/graficos_articulo/Figura_8_PCA_Biplot_POB.png`
- `resultados/graficos_articulo/Figura_9_PCA_Biplot_PER.png`
- `resultados/graficos_articulo/Figura_10_PCA_Biplot_MAY.png`

## Reportes

Para consultar los reportes navegables:

- **Versión Premium (Recomendado):** [informe_ipm_portafolio_premium.html](informe_ipm_portafolio_premium.html) — pieza de portafolio rediseñada a mano con frontend interactivo (modo claro/oscuro, buscador de variables, TOC inteligente y scroll continuo de gráficos). Publicada en vivo en [dmetrics1.github.io/colombia-multidimensional-poverty-pca](https://dmetrics1.github.io/colombia-multidimensional-poverty-pca/).
- **Versión Estándar:** se genera con `quarto render informe_ipm_portafolio.qmd` (no se versiona por tamaño).

Nota: en esta maquina `Rscript` no esta disponible desde PowerShell/PATH. La ruta mas estable por ahora es ejecutar desde RStudio o desde una consola donde R este configurado.

## Metodologia Base

El proyecto distingue dos factores de expansion:

- `FEX_C`: factor de expansion de hogares, usado para conteos y analisis a nivel hogar.
- `FEXP`: factor de expansion de personas, usado para incidencia poblacional.

Tambien separa el uso de bases:

- Base nacional: para totales nacionales calibrados.
- Base departamental: para estimaciones regionales y departamentales.

Esta separacion evita desfases al comparar los resultados regionales con el total nacional publicado por DANE.

