# README del informe de portafolio IPM

Fecha de actualización: 26 de mayo de 2026  
Autor: Daniel José Molina Barrios  
Informe principal (Premium): `informe_ipm_portafolio_premium.html`  
Informe estándar (Quarto): `informe_ipm_portafolio.html`  
Título del informe: Pobreza Multidimensional en Colombia

## Propósito

Este documento explica qué se obtuvo en el proyecto, qué insumos se usaron para construir el informe final y cómo se aplicó la marca personal de Daniel Molina al HTML publicable.

El objetivo del informe es presentar una pieza de portafolio profesional sobre pobreza multidimensional en Colombia, usando microdatos DANE 2025, resultados analíticos en R, visualizaciones regionales y una capa visual personalizada con HTML/CSS.

## Resultado final

Se generaron los siguientes informes HTML para el portafolio:

- **`informe_ipm_portafolio_premium.html`** (Versión definitiva de portafolio hecha a mano con frontend avanzado: modo claro/oscuro persistente en `localStorage`, buscador interactivo de variables, menú lateral dinámico TOC con scroll tracking e IntersectionObserver, y visualización split-grid vertical secuencial de gráficos).
- **`informe_ipm_portafolio.html`** (Versión estándar autocontenida generada de forma automatizada por Quarto).
- **`informe_ipm_portafolio.qmd`** (Archivo fuente de Quarto para el reporte estándar).

También se mantuvo una copia sincronizada del HTML y fuente alterno usado durante el desarrollo:

- `reporte_replicacion_articulo.html`
- `reporte_replicacion_articulo.qmd`

El HTML final incluye:

- portada personalizada con identidad de marca;
- logo DM embebido;
- tabla de indicadores clave;
- tabla de insights estratégicos;
- metodología de datos;
- resultados regionales;
- matrices de correlación;
- análisis PCA;
- implicaciones accionables;
- valor agregado del proyecto;
- alcance y limitaciones;
- cierre ejecutivo.

## Datos usados

El análisis se construye a partir de microdatos DANE 2025 del IPM:

- `datos/raw/Hogares_Nacional.csv`
- `datos/raw/Hogares_Departamental.csv`
- `datos/raw/Viviendas_Nacional.csv`
- `datos/raw/Viviendas_Departamental.csv`
- `datos/raw/Personas_Nacional.csv`
- `datos/raw/Personas_Departamental.csv`

Las bases procesadas quedan en:

- `datos/procesados/base_nacional.rds`
- `datos/procesados/base_departamental.rds`
- `datos/procesados/base_personas_nacional.rds`
- `datos/procesados/base_personas_departamental.rds`
- `datos/procesados/dataset_articulo_2025.rds`

## Resultados obtenidos

Los resultados tabulares usados por el informe están en:

- `resultados/Tablas_Articulo_2025.xlsx`
- `resultados/tablas/Resultados_IPM_2025.xlsx`

Las figuras publicables están en:

- `resultados/graficos_articulo/`

Figuras incluidas:

1. Pobreza por regiones.
2. Bajo logro educativo por región.
3. Empleo formal por región.
4. Educación superior en el hogar por región.
5. Matriz de correlación de variables del hogar.
6. Matriz de correlación de variables de personas.
7. Varianza explicada por componentes principales.
8. Biplot PCA por condición de pobreza.
9. Biplot PCA por número de personas en el hogar.
10. Biplot PCA por personas mayores en el hogar.

## Hallazgos principales incorporados

El informe resalta estos resultados:

- Incidencia nacional estimada por personas: `9,9%`.
- Personas en hogares pobres multidimensionales: `5,22 millones`.
- Mayor incidencia regional: Amazonía - Orinoquía, `18,2%`.
- Menor incidencia regional: Bogotá, `2,2%`.

La lectura interpretativa destaca cuatro ejes:

- brecha territorial;
- educación como factor protector;
- empleo formal como privación estructural;
- composición del hogar como patrón relevante en el PCA.

## Kit de marca usado

Se usó el kit de marca ubicado en:

```text
C:\Users\Estudiante\OneDrive - Universidad del Magdalena\06_Profesional_y_Laboral\02_Marca_Personal_DM\kit_logo_marca
```

Del README del kit se tomó la paleta oficial:

| Color | HEX | Uso en el informe |
|---|---:|---|
| Violeta | `#7C3AED` | Acentos, títulos terciarios y gradiente de portada |
| Azul | `#2563EB` | Color principal, enlaces, títulos, tablas y TOC |
| Cian | `#06B6D4` | Acentos secundarios y gradiente de portada |
| Verde acento | `#10B981` | Token de marca disponible para elementos positivos |
| Negro | `#111827` | Fondo oscuro, texto fuerte y base de portada |
| Gris claro | `#E5E7EB` | Bordes, divisores y líneas suaves |

También se copiaron assets al proyecto para que el informe sea portable:

```text
assets/brand/dm-principal-256px.png
assets/brand/favicon-32x32.png
```

El logo usado en la portada es:

```text
assets/brand/dm-principal-256px.png
```

## Diseño HTML/CSS aplicado

El informe se construyó con Quarto, pero se reforzó con HTML/CSS personalizado para lograr una apariencia de portafolio.

Se agregaron estilos para:

- ocultar la portada básica de Quarto;
- crear una portada propia con `cover-pro`;
- insertar el monograma DM;
- definir chips de autor, fecha, fuente y área temática;
- mostrar KPIs compactos en la portada;
- limitar el ancho de lectura a `760px`;
- mejorar separación entre secciones;
- estilizar notas, cajas interpretativas, callouts y enlaces;
- aplicar colores de marca a tablas `gt`;
- mantener el HTML autocontenido con imágenes embebidas.

## Herramientas usadas

Tecnologías principales:

- R
- Quarto
- HTML
- CSS
- `gt`
- `openxlsx`
- `dplyr`
- `scales`
- microdatos DANE 2025

El informe se renderiza desde:

```text
informe_ipm_portafolio.qmd
```

Comando usado:

```powershell
& "C:\Program Files\RStudio\resources\app\bin\quarto\bin\quarto.exe" render informe_ipm_portafolio.qmd --to html
```

## Validaciones realizadas

Antes de dejar el HTML final, se verificó:

- que el HTML quedara autocontenido;
- que el logo DM estuviera embebido;
- que las 10 figuras analíticas estuvieran embebidas;
- que no hubiera código visible;
- que no aparecieran etiquetas HTML crudas;
- que no hubiera caracteres dañados;
- que no aparecieran secuencias de escape Unicode visibles;
- que no aparecieran rótulos genéricos como `Autor/a` o `Afiliación`;
- que los colores antiguos fueran reemplazados por la paleta de marca personal.

## Archivos finales relevantes

```text
informe_ipm_portafolio_premium.html  # Versión premium definitiva (hecha a mano)
informe_ipm_portafolio.html          # Versión estándar automatizada (Quarto)
informe_ipm_portafolio.qmd           # Fuente estándar de Quarto
README_INFORME_PORTAFOLIO.md         # Documento explicativo de portafolio
assets/brand/dm-principal-256px.png  # Logo DM
assets/brand/favicon-32x32.png       # Favicon DM
resultados/Tablas_Articulo_2025.xlsx # Anexo tabular Excel
resultados/graficos_articulo/         # Figuras 1 a 10
```

## Cómo actualizar el informe

1. Actualizar datos o resultados con el pipeline en `R/`.
2. Confirmar que las tablas estén en `resultados/`.
3. Confirmar que las figuras estén en `resultados/graficos_articulo/`.
4. Editar contenido o estilos en `informe_ipm_portafolio_premium.html` (o regenerar el estándar con `informe_ipm_portafolio.qmd`).
5. Renderizar con Quarto para la versión estándar.
6. Abrir `informe_ipm_portafolio.html` y recargar con `Ctrl + F5`.
