# IPM 2025 — Pobreza Multidimensional en Colombia (PCA)

[![R](https://img.shields.io/badge/R-4.0+-276DC3?style=flat-square&logo=r&logoColor=white)](https://www.r-project.org/)
[![Quarto](https://img.shields.io/badge/Quarto-06B6D4?style=flat-square&logo=quarto&logoColor=white)](https://quarto.org/)
[![License](https://img.shields.io/github/license/dmetrics1/colombia-multidimensional-poverty-pca?style=flat-square&color=2563EB)](LICENSE)
[![Live Report](https://img.shields.io/badge/Live%20Report-7C3AED?style=flat-square&logo=html5&logoColor=white)](https://dmetrics1.github.io/colombia-multidimensional-poverty-pca/)

**Estimación del Índice de Pobreza Multidimensional (Alkire-Foster) de Colombia 2025 con microdatos DANE · lectura multivariada vía PCA · reporte interactivo en R + Quarto.**

> **📊 Reporte en vivo →** [dmetrics1.github.io/colombia-multidimensional-poverty-pca](https://dmetrics1.github.io/colombia-multidimensional-poverty-pca/)
> *Pieza de portafolio con frontend interactivo: buscador de variables, TOC con scroll-tracking y modo claro/oscuro.*
>
> **🎓 Investigación:** replica y expande el artículo *"Perspectiva multidimensional de la pobreza en los hogares colombianos"*, incorporando correlaciones y Análisis de Componentes Principales (PCA).

---

## 🔑 Hallazgos clave

La pobreza multidimensional en Colombia 2025 es, sobre todo, un **fenómeno territorial**: la brecha entre la región más y la menos pobre supera los **16 puntos**.

| Indicador | Valor |
|---|---|
| 🇨🇴 **Incidencia nacional (IPM)** | **9,9%** |
| 👥 **Personas en pobreza multidimensional** | **5,22 millones** |
| 🔺 **Región más pobre** — Amazonía-Orinoquía | **18,2%** |
| 🔺 **Segunda** — Caribe | **17,8%** |
| 🔻 **Menos pobre** — Bogotá | **2,2%** |

**🧬 Lectura multivariada (PCA):** sobre las variables de privación social, las **dos primeras componentes principales** sintetizan la mayor parte de la varianza del fenómeno (Scree Plot + biplots), revelando cómo se agrupan las privaciones por hogar, persona y territorio — algo que los reportes estáticos oficiales no muestran.

📄 *Reporte completo e interactivo en [vivo](https://dmetrics1.github.io/colombia-multidimensional-poverty-pca/).*

---

## 🎯 Qué hace este proyecto

Pipeline reproducible en **R** que toma los microdatos crudos del DANE y produce evidencia auditada:

✅ Estima el **IPM 2025** (metodología oficial **Alkire-Foster**) a nivel nacional y departamental
✅ **Valida** las estimaciones contra los boletines oficiales del DANE
✅ Aplica **PCA** (FactoMineR) para leer la estructura multivariada de las privaciones
✅ **Replica y expande** un artículo académico, con figuras y artículo en Word reproducible

## 🛠️ Stack

**R 4.0+** · `tidyverse` · diseño muestral ponderado (`survey`, `srvyr`) · PCA (`FactoMineR`, `factoextra`) · tablas (`gt`, `gtsummary`) · **Quarto** · `ggplot2`

## 🚀 Reproducir

```r
# Desde RStudio, en la carpeta proyecto_ipm/ (instala paquetes faltantes solo)
source("main.R")          # pipeline completo: carga → cruce → validación → IPM → PCA
source("render_articulo.R")   # compila el artículo académico (Word)
```

> Los microdatos del DANE (GEIH/ECV) **no se versionan** (tamaño + licencia). El pipeline los espera en `proyecto_ipm/datos/`. Detalle técnico de ejecución en [`proyecto_ipm/README.md`](proyecto_ipm/README.md).

---

<details>
<summary><b>📁 Estructura del proyecto</b></summary>

```
.
├── README.md · LICENSE · index.html        # Doc, licencia, redirect a Pages
└── proyecto_ipm/                            # Proyecto R/RStudio
    ├── R/                  00_paquetes → 01_cargar → 02_cruce → 03_validaciones
    │                       → 04_estimaciones → 05_analisis → 07_tablas_dane → 08_replicacion
    ├── informe_ipm_portafolio_premium.html  # Reporte interactivo (pieza de portafolio)
    ├── informe_ipm_portafolio.qmd           # Fuente Quarto del reporte
    ├── articulo_pobreza_multidimensional.Rmd / .docx  # Artículo académico reproducible
    ├── resultados/         graficos_articulo/ (Figuras 1–10) · tablas (.xlsx)
    ├── diccionario/        Diccionario oficial DANE (Excel + Markdown)
    ├── metodologia/        Guías oficiales de construcción del IPM
    ├── reportes_dane/      Boletines DANE para validación
    ├── assets/brand/       Logo + favicons del reporte
    └── main.R · render_articulo.R · referencias.bib
```

</details>

---

## 📄 Licencia · 🙏 Créditos

Distribuido bajo licencia **MIT** — úsalo libremente con atribución (ver [`LICENSE`](LICENSE)).
**Datos:** DANE — microdatos oficiales 2025 · **Métodos:** IPM Alkire-Foster + PCA (`FactoMineR`) · **Reportería:** Quarto + R.

---

## 👤 Autor

**Daniel Molina Barrios** — Economista & Data Scientist · Santa Marta, Colombia

> *"Transformo datos en soluciones, productos y decisiones."*

[![GitHub](https://img.shields.io/badge/GitHub-2563EB?style=flat-square&logo=github&logoColor=white)](https://github.com/dmetrics1)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-7C3AED?style=flat-square&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/daniel-molina-b76a4323b/)
[![Email](https://img.shields.io/badge/Email-06B6D4?style=flat-square&logo=gmail&logoColor=white)](mailto:dm0025900@gmail.com)
