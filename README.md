# Colombia Multidimensional Poverty Analysis (IPM) & PCA

[![R](https://img.shields.io/badge/R-%23276DC3.svg?style=flat&logo=r&logoColor=white)](https://www.r-project.org/)
[![Quarto](https://img.shields.io/badge/Quarto-%2347848F.svg?style=flat&logo=quarto&logoColor=white)](https://quarto.org/)
[![Markdown](https://img.shields.io/badge/Markdown-%23000000.svg?style=flat&logo=markdown&logoColor=white)](https://daringfireball.net/projects/markdown/)

Este repositorio contiene un pipeline analítico en **R** diseñado para estimar, auditar y analizar el **Índice de Pobreza Multidimensional (IPM)** en Colombia para el año **2025**, utilizando microdatos oficiales del **DANE**. Además, replica y expande el marco metodológico del artículo *"Perspectiva multidimensional de la pobreza en los hogares colombianos"*, incorporando análisis correlacionales y **Análisis de Componentes Principales (PCA)**.

---

## 📂 Estructura del Workspace

El proyecto está organizado de forma modular, separando el código fuente, la documentación técnica y los reportes interactivos del procesamiento masivo de datos:

*   **`proyecto_ipm/`**: Carpeta principal del proyecto R/RStudio.
    *   **`R/`**: Scripts de R estructurados y modulares para carga, cruce, validación, estimación y modelado (PCA).
    *   **`resultados/`**: Gráficos analíticos generados (PNG) y tablas consolidadas de salida (Excel).
    *   **`diccionario/`**: Diccionario oficial de variables DANE y su versión estructurada en Markdown.
    *   **`metodologia/`**: Guías oficiales de construcción del IPM.
    *   **`reportes_dane/`**: Boletines de prensa oficiales del DANE para validación de resultados.
    *   **`main.R`**: Orquestador y punto de entrada para ejecutar todo el pipeline.
*   **`datos/`** *(Excluido de Git)*: Microdatos masivos originales de la Gran Encuesta Integrada de Hogares (GEIH) del DANE en formatos SPSS (`.sav`) y Stata (`.dta`).

---

## 🛠️ Requisitos e Instalación

Para ejecutar el pipeline localmente, abre RStudio o la consola R en la carpeta `proyecto_ipm/` y el script orquestador instalará automáticamente los paquetes faltantes.

### Paquetes requeridos:
*   **Manipulación de datos:** `tidyverse` (`dplyr`, `tidyr`, `readr`, `ggplot2`), `readxl`, `janitor`, `glue`
*   **Diseño muestral ponderado:** `survey`, `srvyr`
*   **Modelado y correlación:** `FactoMineR`, `factoextra`, `corrplot`, `ggcorrplot`
*   **Tablas y reportes:** `gt`, `gtExtras`, `gtsummary`, `openxlsx`

---

## 🚀 Guía de Inicio Rápido

### 1. Clonar el repositorio
```bash
git clone https://github.com/dmetrics1/colombia-multidimensional-poverty-pca.git
cd colombia-multidimensional-poverty-pca/proyecto_ipm
```

### 2. Ejecutar el Pipeline Completo
Abre R y ejecuta el script principal:
```r
source("main.R")
```
Esto procesará las fuentes de datos, validará las estimaciones frente a las oficiales del DANE y exportará todas las tablas y gráficos a la carpeta `resultados/`.

### 3. Generar el Artículo Académico (Word)
Para compilar la última versión del documento científico con todos los gráficos embebidos dinámicamente, corre:
```r
source("render_articulo.R")
```

---

## 📊 Reportes y Documentos Disponibles

El proyecto cuenta con múltiples salidas de visualización:
1.  **Versión Premium Interactiva (`proyecto_ipm/informe_ipm_portafolio_premium.html`):** Diseñada como pieza de portafolio con frontend interactivo (buscador de variables, menú TOC con scroll-tracking, switch de modo claro/oscuro y visualización split-grid vertical secuencial de gráficos).
2.  **Reporte Estándar Quarto (`proyecto_ipm/informe_ipm_portafolio.html`):** Reporte generado dinámicamente.
3.  **Artículo Académico (`proyecto_ipm/articulo_pobreza_multidimensional.docx`):** Documento formal formateado en estilos profesionales APA, listo para edición de contenido.

---

## 📝 Notas de Licencia y Reproducibilidad
Los microdatos analizados son de libre acceso y propiedad exclusiva del **DANE (Departamento Administrativo Nacional de Estadística - Colombia)**. Las estimaciones y el pipeline de análisis fueron estructurados con fines académicos y de investigación.
