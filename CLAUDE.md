# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

This is a Quarto **manuscript** project for an academic paper in Spanish analyzing the liberalization of the Spanish railway system — specifically the transition from monopoly (RENFE) to oligopoly (RENFE, OUIGO, iryo) in the high-speed rail sector.

## Build commands

```bash
quarto preview          # live preview with auto-reload (opens browser)
quarto render           # render all configured formats (HTML, DOCX, JATS)
quarto render --to pdf  # render PDF (requires uncommenting pdf format in _quarto.yml)
quarto render --no-freeze  # force re-execution of R code chunks (bypasses freeze cache)
```

## Key files

- `index.qmd` — the sole article source; all content lives here
- `_quarto.yml` — project config: output formats, Hypothesis comments, freeze setting
- `references.bib` — BibTeX bibliography (currently only has a placeholder entry)
- `_manuscript/` — compiled outputs (PDF, LaTeX); auto-generated, do not edit manually

## Important configuration details

- `execute: freeze: true` is set in `_quarto.yml`, so R code chunks **will not re-run** on `quarto render` unless `--no-freeze` is passed. This means adding or changing R code requires `quarto render --no-freeze` to see updated output.
- PDF output is commented out in `_quarto.yml`; uncomment the `pdf: default` line to enable it.
- HTML output has [Hypothesis](https://hypothes.is) annotation enabled.

## Paper structure (work in progress)

The introduction (section 1) is written. Remaining sections planned in `index.qmd`:

- **2.1** Market structure and entry barriers (operators, Adif, regulation)
- **2.2** Demand evolution — passenger data from INE, chart in R
- **2.3** Market concentration — market shares, HHI index, calculated in R
- **2.4** Strategic behavior — Bertrand price competition model
- **2.5** Market power — Renfe's privileged position in the oligopoly
- **3** Discussion and conclusions
- **4** Bibliography (sources listed in `index.qmd` under "Fuentes" need proper BibTeX entries in `references.bib`)

## Citations

References go in `references.bib` (BibTeX format) and are cited in text with `[@key]`. The paper needs proper entries for: Spanish legislation (BOE links), EU directive 91/440/CEE, INE data, CNMC sector reports, and a microeconomics textbook.
