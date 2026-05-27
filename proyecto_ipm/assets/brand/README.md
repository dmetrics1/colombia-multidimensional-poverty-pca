# Kit de marca Daniel Molina (v2 — bordes suavizados)

Kit de archivos del logo en todos los formatos y tamaños listos para usar.
**Esta es la versión 2** con bordes vectoriales suavizados — las curvas son completamente lisas, sin irregularidades.

## Estructura

### 📐 01-svg-vectorial/
**Los archivos master.** Úsalos siempre que puedas: son vectoriales, escalan a cualquier tamaño sin pérdida, y son editables en Illustrator, Figma, Inkscape o Affinity Designer.

- `01-principal.svg` — Versión oficial con degradado violeta→azul→cian
- `02-monocromatico.svg` — Azul plano (#2563EB)
- `03-negativo.svg` — Blanco sobre fondo oscuro (#111827)
- `04-escala-grises.svg` — Gris medio (#6B7280)
- `05-negro.svg` — Negro plano (impresión 1 tinta, fax, sellos)
- `06-blanco.svg` — Blanco puro sin fondo (overlay sobre cualquier color)
- `*.pdf` — Versiones PDF vectoriales para imprenta profesional

### 🌐 02-web/
**Para tu sitio web.**

- `dm-principal-1024px.png` y similares — Logo principal en varios tamaños PNG
- `dm-principal-1024px-transparente.png` — Sin fondo (para componer sobre cualquier color)
- `dm-principal-1024px-blanco.png` — Con fondo blanco (preview directo)
- `dm-negativo-1024px.png` — Para hero sections oscuras
- `og-image-1200x630-*.png` — Imagen para `<meta property="og:image">` y compartir en redes

**Tamaños recomendados según uso:**
- Header de web (logo destacado): 256-512 px
- Logo en menú o footer: 128-256 px
- Botón o icono pequeño: 64 px

### 📱 03-redes-sociales/
**Avatares y portadas listos para subir.**

- `avatar-1080-blanco.png` — Avatar con fondo blanco (Instagram, X)
- `avatar-1080-oscuro.png` — Avatar con fondo oscuro (LinkedIn corporativo)
- `avatar-1080-app-icon.png` — **⭐ Recomendado**: estilo app icon con fondo gradient, logo blanco. Es el más impactante y memorable
- `avatar-1080-transparente.png` — Para plataformas que permiten transparencia
- `linkedin-portada-1584x396-*.png` — Portada de perfil LinkedIn
- `twitter-portada-1500x500-*.png` — Portada de X/Twitter
- `story-1080x1920-*.png` — Story de IG / Reels portada / TikTok

### 🖨️ 04-impresion/
**Para imprenta profesional, tarjetas, facturas, presentaciones.**

- `*-3000px-300dpi.png` — Alta resolución para impresión (resolución de imprenta)
- `*.pdf` — **Mejor opción para imprenta**: vectorial, escalable, sin pérdida
- `dm-1tinta-negro-3000px.png` — Para impresión a 1 tinta, fax, sellos, formularios

**Para tarjetas de visita**: usa los PDFs (`01-principal.pdf` o `05-negro.pdf` si es 1 tinta).
**Para facturas/presentaciones**: PNG 3000px o el SVG directamente.

### 👕 05-merchandising/
**Ropa, tazas, stickers, totebags.**

- `*-4000px-transparente.png` — Máxima resolución, fondo transparente, listo para serigrafía/sublimación

**Recomendaciones:**
- Camisetas claras → `01-principal` (con degradado) o `05-negro`
- Camisetas oscuras → `06-blanco` o `03-negativo`
- Tazas blancas → `01-principal`
- Tazas negras → `06-blanco`
- Stickers transparentes → `01-principal-4000px-transparente.png`

### 🔖 06-favicon/
**Iconos para tu web.**

- `favicon.ico` — El archivo clásico (incluye 16px, 32px, 48px en uno solo)
- `favicon-16x16.png`, `favicon-32x32.png`, etc — PNGs individuales
- `apple-touch-icon.png` (180×180) — Para iOS al añadir a pantalla de inicio
- `favicon-192x192.png` y `favicon-512x512.png` — Para Android / PWA / manifest.json
- `favicon-source-cuadrado.svg` — Master vectorial editable

**Cómo instalar en tu web:**

```html
<!-- En el <head> de tu HTML -->
<link rel="icon" type="image/x-icon" href="/favicon.ico">
<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
<link rel="manifest" href="/site.webmanifest">
```

Y un `site.webmanifest` con:
```json
{
  "icons": [
    { "src": "/favicon-192x192.png", "sizes": "192x192", "type": "image/png" },
    { "src": "/favicon-512x512.png", "sizes": "512x512", "type": "image/png" }
  ]
}
```

---

## Paleta de colores oficial

| Color | HEX | Uso |
|-------|------|-----|
| Violeta | `#7C3AED` | Inicio del degradado |
| Azul | `#2563EB` | Color medio / monocromático |
| Cian | `#06B6D4` | Final del degradado |
| Verde acento | `#10B981` | Acento secundario |
| Negro | `#111827` | Texto / fondos oscuros |
| Gris claro | `#E5E7EB` | Bordes / divisores |

---

## Notas técnicas

✅ **v2 con bordes suavizados**: el monograma fue revectorizado aplicando pre-filtrado de la imagen (blur gaussiano + filtro mediano) y vectorización con suavizado máximo (potrace `--alphamax 1.334 --opttolerance 1.0`). El resultado son curvas Bézier limpias sin las micro-irregularidades de la primera versión.

⚠️ **Origen**: este kit fue **reconstruido vectorialmente** a partir del PNG del brandbook. Si en algún momento consigues el SVG original de quien diseñó el logo, sustitúyelo en `01-svg-vectorial/` y todos los demás archivos pueden regenerarse desde ahí.

⚠️ **Tipografía**: este kit contiene solo el monograma DM. El wordmark "DANIEL MOLINA" en Aeonik Bold no se incluye porque Aeonik es una fuente comercial con licencia. Para el wordmark completo, abre el SVG en Figma/Illustrator y añade el texto con tu licencia de Aeonik, o usa Inter Bold como alternativa libre.
