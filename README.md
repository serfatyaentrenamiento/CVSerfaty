# CV de Agustín Serfaty

Repositorio del CV base ("maestro") y sus anexos. Diseñado para ser fácil de mantener y derivar versiones específicas por postulación.

## Archivos

- **`cv-maestro.md`** — Fuente única del CV. Contiene **toda** la experiencia y formación. Es el archivo a editar cuando haya cambios.
- **`anexo-certificaciones.md`** — Índice del anexo con las certificaciones escaneadas.
- **`certificaciones/`** — Imágenes de los certificados, nombradas por año y tema.
- **`exports/`** — Versiones generadas en `.docx` y `.pdf` para enviar.

## Cómo editar el CV

1. Abrir `cv-maestro.md` con cualquier editor de texto.
2. Agregar o modificar la sección correspondiente (ver formato en las experiencias existentes):
   ```
   **Rol** — Institución, Ciudad
   *MM/AAAA – MM/AAAA*
   - Bullet de tarea o logro.
   ```
3. Guardar.
4. Regenerar el `.docx` con el script de abajo.

## Cómo exportar a .docx (ATS-friendly) y .pdf

Desde la raíz del repo:

```bash
# .docx
pandoc cv-maestro.md -o exports/CV-Agustin-Serfaty.docx

# .pdf (si tenés pandoc + LaTeX instalados; alternativamente abrir el .docx con LibreOffice)
pandoc cv-maestro.md -o exports/CV-Agustin-Serfaty.pdf

# Convertir .docx → .pdf con LibreOffice
libreoffice --headless --convert-to pdf --outdir exports exports/CV-Agustin-Serfaty.docx
```

El `.docx` resultante es plano, en una sola columna, sin tablas ni cuadros de texto: óptimo para sistemas de filtrado automático (ATS) de bolsas de trabajo y plataformas como LinkedIn, Bumeran, Computrabajo, etc.

## Cómo derivar una versión por postulación

1. Copiar `cv-maestro.md` a `cv-{puesto}.md` (ej: `cv-preparador-fisico-club.md`).
2. Recortar lo que **no** aplica al puesto (ej: si es para un club deportivo, achicar la sección de docencia escolar; si es para un colegio, achicar guardavidas).
3. Ajustar el "Perfil profesional" del encabezado para alinear con el puesto.
4. Exportar a `.docx` con el comando de arriba.

**Regla HR**: incluir palabras clave del aviso o descripción del puesto en el cuerpo del CV (en perfil, bullets o competencias). Eso ayuda al filtro automático.

## Cómo armar un anexo de certificados en un solo PDF

Para enviar junto al CV un PDF único con los escaneos relevantes a la postulación:

```bash
scripts/armar-anexo.sh Anexo-Nautico-Docente \
  certificaciones/2019-timonel-yate-vela-motor-pna.jpeg \
  certificaciones/2019-guardavidas-diploma-amgaa.jpeg \
  certificaciones/2019-libreta-guardias-historial.jpeg \
  certificaciones/2023-titulo-profesor-ef-isef27.jpeg
```

El primer argumento es el nombre del PDF de salida (sin `.pdf`); el resto son los archivos en el orden en que querés que aparezcan. Se genera en `exports/`.

Para subir nuevos escaneos: meterlos en `certificaciones/` con un nombre tipo `AAAA-tema-descripcion.jpeg` (ver `anexo-certificaciones.md` para la convención).

## Reglas fijas (aplican a TODAS las versiones del CV)

- **Foto de perfil**: incluir siempre `certificaciones/foto-perfil.jpg` arriba del encabezado.
- **Rol de Preceptor**: el cargo de **Preceptor del Colegio de la Inmaculada Concepción (Santa Fe)** debe aparecer siempre en el encabezado y en el cuerpo del CV, incluso cuando la postulación no sea docente. Es el rol principal en actividad y aporta prestigio institucional.

## Convenciones

- Fechas en formato `MM/AAAA – MM/AAAA` o `AAAA – Actualidad`.
- Bullets que empiezan con verbo en infinitivo o sustantivo de acción.
- Sin DNI ni dirección detallada (sólo ciudad), por privacidad y estándar moderno.
- Sin tablas, columnas ni íconos en el `.md` para mantener compatibilidad ATS al exportar.
