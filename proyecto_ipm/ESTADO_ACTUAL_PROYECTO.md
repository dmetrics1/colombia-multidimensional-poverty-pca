# Estado actual del proyecto IPM

Fecha de revision: 26 de mayo de 2026.

## Resumen

El proyecto esta organizado y funcional. Se limpiaron carpetas vacias de arrastre (`R/resultados/` y `resultados/graficos/`) para que las salidas queden concentradas en `resultados/graficos_articulo/` y `resultados/tablas/`.

La documentacion principal fue revisada frente a la estructura real del proyecto. El informe HTML fue reescrito como pieza publica de portafolio y se genero una copia con nombre limpio: `informe_ipm_portafolio.html`.

## Carpetas vigentes

```text
datos/raw/          CSV del DANE usados por el pipeline
datos/procesados/   bases .rds ya cruzadas y dataset del articulo
diccionario/        diccionario oficial DANE y version limpia
metodologia/        documentos metodologicos oficiales
R/                  scripts modulares del pipeline
reportes_dane/      boletines oficiales DANE
resultados/         tablas y graficos finales
```

## Archivos de datos procesados

- `base_nacional.rds`
- `base_departamental.rds`
- `base_personas_nacional.rds`
- `base_personas_departamental.rds`
- `dataset_articulo_2025.rds`

## Resultados generados

- `resultados/tablas/Resultados_IPM_2025.xlsx`
- `resultados/Tablas_Articulo_2025.xlsx`
- 10 figuras PNG en `resultados/graficos_articulo/`

## Reportes disponibles

- `reporte_replicacion_articulo.qmd`
- `reporte_replicacion_articulo.html` (Reporte de replicación)
- `informe_ipm_portafolio.qmd`
- `informe_ipm_portafolio.html` (Reporte generado por Quarto)
- `informe_ipm_portafolio_premium.html` (Versión premium de portafolio hecha a mano con frontend avanzado: modo claro/oscuro persistente, buscador interactivo de variables, menú TOC inteligente con scroll tracking y visualización split-grid vertical secuencial de gráficos)
- `articulo_pobreza_multidimensional.Rmd`
- `articulo_pobreza_multidimensional.docx`

## Pendientes reales

1. Completar los 33 marcadores `[REDACTAR:]` del articulo R Markdown.
2. Actualizar autor, institucion y correo en el YAML del `.Rmd`.
3. Revisar si se quiere agregar `apa.csl`; actualmente existe `referencias.bib`, pero no `apa.csl`.
4. Confirmar la forma de compilacion en el equipo, porque `Rscript` no esta disponible desde PowerShell/PATH.
5. Si se van a hacer nuevas salidas, mantenerlas dentro de `resultados/` y evitar crear resultados dentro de `R/`.

## Convencion de trabajo recomendada

- Datos originales: no modificar `datos/raw/`.
- Datos derivados: guardar en `datos/procesados/`.
- Graficos publicables: guardar en `resultados/graficos_articulo/`.
- Tablas finales: guardar en `resultados/tablas/` o en `resultados/` cuando sean anexos del articulo.
- Documentos finales: mantener en la raiz del proyecto para facil acceso.

