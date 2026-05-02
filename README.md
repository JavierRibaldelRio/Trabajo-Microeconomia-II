# Del monopolio al oligopolio: la liberalización del sistema ferroviario español

Trabajo académico de Microeconomía II (Doble Grado ADE + INF, UPV) que analiza la transición del mercado ferroviario español de monopolio (RENFE) a oligopolio (RENFE, OUIGO, iryo) en el sector de la alta velocidad.

- **Autor:** Javier Ribal del Río
- **Profesora:** Silvia Andrés González-Moralejo

## Estructura

- `index.qmd` — fuente del artículo (Quarto)
- `_quarto.yml` — configuración del proyecto
- `references.bib` — bibliografía (BibTeX)
- `src/header.tex` — cabecera/pie y márgenes LaTeX
- `R/parse_data.R` — parsea `data/data_train.csv` → `data/filtered_data_train.rds`
- `R/parse_price.R` — parsea `data/data_price.csv` → `data/filtered_data_price.rds`
- `data/` — datos originales (CNMC) y `.rds` derivados
- `_manuscript/` — outputs renderizados (auto-generado)

## Compilación

```bash
quarto preview                # vista previa con auto-recarga
quarto render                 # renderiza HTML, DOCX, JATS
quarto render --to pdf        # renderiza PDF
quarto render --no-freeze     # fuerza re-ejecución de los chunks de R
```

`execute: freeze: true` en `_quarto.yml` cachea los chunks; usa `--no-freeze` para reejecutarlos.

## Datos

- *Indicadores trimestrales del transporte* (CNMC, 2026)
- *Indicador del precio medio mensual por trayecto* (CNMC, 2026)

Para regenerar los `.rds`:

```bash
Rscript R/parse_data.R
Rscript R/parse_price.R
```

## Dependencias R

`tidyverse`, `ggh4x`, `scales`, `stringi`.
