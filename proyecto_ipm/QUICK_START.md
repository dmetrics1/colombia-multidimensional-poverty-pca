# 🚀 Quick Start: Compilar el artículo a Word

## Opción 1: Usar el script (RECOMENDADO)

Abre RStudio o la terminal R en la carpeta `proyecto_ipm` y ejecuta:

```r
source("render_articulo.R")
```

Este script:
- ✅ Verifica que todos los paquetes estén instalados
- ✅ Revisa que existan los archivos de entrada (Excel, referencias)
- ✅ Lista los gráficos disponibles
- ✅ Compila el documento con mensajes claros
- ✅ Muestra el tiempo de compilación y tamaño final

**Tiempo esperado:** 30-60 segundos

---

## Opción 2: Hacerlo manualmente en RStudio

1. **Abre el archivo:**
   - `Archivo → Abrir archivo → articulo_pobreza_multidimensional.Rmd`

2. **Compila a Word:**
   - Botón `Knit ▼` en la barra superior
   - Selecciona `Knit to Word` (officedown::rdocx_document)
   
   O presiona: **Ctrl+Shift+K**

3. **Espera a que termine**
   - Verás el panel "R Markdown" con el progreso
   - Cuando diga `Output created` está listo

4. **Abre el documento:**
   - El archivo `articulo_pobreza_multidimensional.docx` se abrirá automáticamente
   - O encuéntralo en la carpeta `proyecto_ipm`

---

## Opción 3: Desde línea de comandos

```bash
# En la carpeta proyecto_ipm:
Rscript render_articulo.R
```

Nota actual: en la revisión del 26 de mayo de 2026, `Rscript` no aparece disponible desde PowerShell/PATH en este equipo. Si ese comando falla, usar RStudio y ejecutar `source("render_articulo.R")`.

---

## ¿Qué pasa si hay errores?

### Error 1: "could not find file reference_docx"
**RESUELTO** ✅ Ya actualizamos el YAML para `reference_docx: null`

### Error 2: "Paquete XXX no encontrado"
```r
# Instala el paquete faltante
install.packages("nombre_paquete")

# Luego intenta de nuevo
source("render_articulo.R")
```

### Error 3: Gráficos no aparecen
**NORMAL** 📊 Si no ejecutaste el pipeline `main.R` antes, los gráficos no existen.

El documento se compilará igual, pero mostrará "PLACEHOLDER" donde deberían estar las figuras.

**Solución:** Antes de compilar, ejecuta:
```r
setwd("proyecto_ipm")
source("R/08_replicacion_articulo.R")  # Genera todas las figuras
source("render_articulo.R")             # Compila el documento
```

### Error 4: Tabla 2 muestra vacía
El código está configurado para saltar si no encuentra `datos/procesados/base_departamental.rds`.

**Solución:** Ejecuta el pipeline completo:
```r
source("main.R")  # Ejecuta todo desde cero
```

### Error 5: "No se puede acceder a referencias.bib"
**Sin referencias.bib:** El documento compilará sin bibliografía al final.

**Solución (opcional):**
- Crea un archivo `referencias.bib` vacío en `proyecto_ipm/`
- O descarga el estilo CSL desde https://citationstyles.org/

```bash
# En PowerShell o Git Bash:
touch referencias.bib
```

---

## Después de compilar ✨

Estado actual: `articulo_pobreza_multidimensional.docx` ya existe en la carpeta del proyecto. Si se recompila, el archivo se sobrescribe.

El archivo **`articulo_pobreza_multidimensional.docx`** está listo para:

1. **Editar en Word**
   - Doble clic para abrir
   - Redacta las secciones marcadas con [REDACTAR: ...]
   - Mantén la numeración automática de figuras/tablas

2. **Enviar a coautores**
   - Usa el control de cambios de Word
   - Todos ven quién editó qué

3. **Recompilar tras cambios en R**
   - Si cambias el código R y quieres actualizar figuras
   - Ejecuta `render_articulo.R` de nuevo
   - El .docx se sobrescribe automáticamente

---

## Próximos pasos

Una vez que el documento esté compilado:

### 1. Redacta el contenido
Abre el `.docx` en Word y busca `[REDACTAR:`:
- Resumen (200-250 palabras)
- Introducción (600-900 palabras)
- Antecedentes (500-800 palabras)
- Interpretaciones de figuras (2-3 párrafos c/u)
- Discusión (600-900 palabras)
- Conclusiones (3 bloques)

### 2. Actualiza referencias
Si usas `.bib`:
```bibtex
@article{dane2025,
  title={Índice de Pobreza Multidimensional},
  author={DANE},
  year={2025}
}
```

Si usas Word manualmente:
- Referencias → Insertar cita → New Source
- O pega el texto en formato APA 7 al final

### 3. Revisa el formato
- Márgenes: 1.25" izquierda, 1" otros lados ✅ (automático)
- Fuente: Times New Roman o Calibri ✅ (officedown)
- Figuras centradas con pie inferior ✅ (automático)
- Tablas con estilos profesionales ✅ (flextable)
- Numeración de secciones ✅ (automático)

### 4. Exporta final
- `Archivo → Exportar como PDF` (si lo necesita la revista)
- O mantén en `.docx` para edición colaborativa

---

## Preguntas frecuentes

**P: ¿Cuánto tiempo tarda compilar?**  
R: 30-60 segundos en la mayoría de computadores.

**P: ¿Puedo editar el .docx y después recompilar?**  
R: Si haces cambios en Word y recompilasNO, se pierde todo. El `.Rmd` siempre sobrescribe el `.docx`. Guarda cambios en el `.Rmd` en su lugar.

**P: ¿Cómo agrego referencias?**  
R: Crea un `referencias.bib` con tus citas BibTeX. Luego usa `@citekey` en el texto.

**P: ¿Puedo cambiar estilos de Word?**  
R: Sí, abre el `.docx` compilado, ajusta estilos normalmente. Para que persist en futuras compilaciones, crea una `plantilla_articulo.docx` personalizada y apunta a ella en el YAML.

**P: ¿Qué pasa si me equivoco al redactar?**  
R: En Word, `Ctrl+Z` deshace. O vuelve a compilar desde el `.Rmd` para revertir todo.

---

## Soporte

Si encuentras otros errores:

1. **Lee el mensaje de error completo** en la consola R
2. **Busca "Error:" o "Warning:"** en el panel de compilación
3. **Usa Google** con el mensaje de error exacto
4. **Revisa INSTRUCCIONES_RMD.md** para soluciones detalladas

---

**Versión:** Quick Start v1.0  
**Última actualización:** 2026-05-17  
**Estado:** Listo para usar ✅

