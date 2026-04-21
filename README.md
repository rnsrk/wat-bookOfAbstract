# WissKI-Anwender*innentreffen — Book of Abstract (LaTeX-Vorlage)

LaTeX-Vorlage für Extended Abstracts für das Book of Abstracts des WissKI-Anwender*innentreffens: Titel, Autorinnen und Autoren mit ORCID-iD, E-Mail-Adresse und Affiliationen, Abschnitte, Fußnoten, Literatur (BibLaTeX + Biber), Block- und Inline-Zitate, Quellcode, Abbildungen, Tabellen und (Hyper-)Links. **Sprache der Beispieltexte:** Deutsch (modernes **babel** mit `\babelprovide[import, main]{german}` in `main.tex` — kompatibel mit Babel ab ca. Version 24 / TeX Live 2024ff.).

**Lizenz:** [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/deed.de) (siehe `LICENSE`).

## Für Beitragseinreichende des WissKI-Anwender\*innentreffen

### Allgemein

Mit Hilfe dieser Vorlage erstellen Sie Ihre Beiträge für das Book of Abstracts des WissKI-Anwender\*innentreffen. Ein einfacher Weg ist über [Overleaf durch einen Import und die anschließende Bearbeitung des Templates](#nutzung-in-overleaf-import-von-github). Arbeiten Sie in der `main.tex`, behalten Sie deren Struktur bei und nutzen Sie ausschließlich die im Template verwendete Formatierungen (`cheat_doc.tex.bkp` können Sie als "Spickzettel" verwenden). Ihre Literatur-Daten legen Sie in der Datei `references.bib` an. Nach Fertigstellung können Sie gerne das ganze Repositorium komprimieren und an [unsere Redaktion](mailto:info@wiss-ki.eu) senden.

### Nutzung in Overleaf (Import von GitHub)

1. Laden Sie das Repository als [zip-Datei(https://github.com/rnsrk/wat-bookOfAbstract/releases/tag/v2.0.0)] herunter.
2. In [Overleaf(https://www.overleaf.com/project)]: **New project** → **Upload project**.
3. Das Template sollte automatisch kompilieren.
4. **Recompile**. Literatur und Querverweise können zwei Durchläufe brauchen; Overleafs **latexmk** (mit `latexmkrc`) startet Biber bei Bedarf.
5. Das fertige Repositorium laden sie unter **File** > **Download as source (.zip)** herunter.

** Für Entwickler und lokalem Build

## Projektaufbau

| Datei / Ordner   | Rolle |
|------------------|--------|
| `main.tex`       | Hauptquelle (in Overleaf als Hauptdokument setzen). |
| `references.bib` | Beispiel-BibTeX-Datenbank. |
| `img/`           | Abbildungen; `\graphicspath{{img/}}` in `main.tex`. |
| `latexmkrc`      | `latexmk` / Overleaf: pdfLaTeX + Biber. |
| `Makefile`       | Optional: lokaler Build mit `make`. |

## Lokaler Build

### Voraussetzungen

#### Pakete

**Programme** (auf dem `PATH`):

| Komponente | Rolle |
|------------|--------|
| `pdflatex` | PDF-Kompilation |
| `biber` | Literatur-Backend für **BibLaTeX** (nicht klassisches `bibtex`; siehe `\usepackage[backend=biber,…]{biblatex}` in `main.tex`) |
| `latexmk` | optional, empfohlen — nutzt `latexmkrc` wie Overleaf |
| `make` | optional — `Makefile`-Kette |

**LaTeX-Pakete** (aus `main.tex`; bei Minimalinstallationen fehlen einzelne `.sty`-Dateien, bis die passenden TeX-Live-Collections nachinstalliert sind):

- `geometry`, `fontenc`, `babel` (Deutsch über `\babelprovide`), `parskip`, `textcase`, `titlesec`, `listings`, `graphicx`, `booktabs`, `url`, `biblatex`, `orcidlink`, `hyperref`
- Schrift: Paket **`noto`** (optional; ohne es nutzt die Vorlage die Standard-Sans der Distribution — siehe Abschnitt [Schrift](#schrift))

**Distribution:** TeX Live-Pakete der jeweiligen Distribution installieren, nicht nur `bibtex`. **`latexmk`** ist oft eine **eigene** Paketauswahl und fehlt bei Minimalinstallationen — dann meldet die Shell z. B. „Unknown command: latexmk“. Nachinstallieren:

- **Debian / Ubuntu:** `sudo apt install latexmk texlive-bibtex-extra biber` (Minimalinstallationen: ggf. `texlive-latex-extra` für weitere `.sty`-Abhängigkeiten; für **Noto** wie in `main.tex`: `texlive-fonts-extra`)
- **Arch Linux** (u. a. Manjaro, CachyOS): `sudo pacman -S texlive-binextra texlive-bibtexextra biber` — **`texlive-bibtexextra`** enthält u. a. **biblatex** (`.sty`), das **`biber`**-Programm liegt im **eigenen** Paket **`biber`** (`extra/biber`), nicht zwingend in `PATH`, wenn es fehlt. Bei **Noto** zusätzlich `texlive-fontsextra`, für `fontaxes.sty` u. a. `texlive-latexextra`

Danach ggf. neues Terminal oder neu einloggen.

Mit `latexmk` (empfohlen, wenn installiert; nutzt `latexmkrc` wie Overleaf):

```bash
latexmk -pdf main.tex
```

Ohne `latexmk` — **GNU Make** (entspricht der `Makefile`-Kette):

```bash
make
```

Oder dieselbe Kette manuell:

```bash
pdflatex main.tex
biber main
pdflatex main.tex
pdflatex main.tex
```