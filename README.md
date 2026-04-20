# WissKI-Anwender*innentreffen — Book of Abstract (LaTeX-Vorlage)

LaTeX-Vorlage für Extended Abstracts für das Book of Abstracts des WissKI-Anwender*innentreffens: Titel, Autorinnen und Autoren mit ORCID-iD, E-Mail-Adresse und Affiliationen, Abschnitte, Fußnoten, Literatur (BibLaTeX + Biber), Block- und Inline-Zitate, Quellcode, Abbildungen, Tabellen und (Hyper-)Links. **Sprache der Beispieltexte:** Deutsch (modernes **babel** mit `\babelprovide[import, main]{german}` in `main.tex` — kompatibel mit Babel ab ca. Version 24 / TeX Live 2024ff.).

**Lizenz:** [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/deed.de) (siehe `LICENSE`).

## Nutzung in Overleaf (Import von GitHub)

1. Dieses Repository auf **GitHub** legen (öffentlich oder privat).
2. In Overleaf: **Neues Projekt** → **Projekt importieren** → **Von GitHub**.
3. GitHub ggf. autorisieren und das Repository auswählen.
4. **Hauptdokument** auf `main.tex` stellen, falls nicht automatisch: **Menü** → **Hauptdokument** → `main.tex`.
5. **Menü** → **Compiler** → **pdfLaTeX** (empfohlen; entspricht dieser Vorlage).
6. **Recompile**. Literatur und Querverweise können zwei Durchläufe brauchen; Overleafs **latexmk** (mit `latexmkrc`) startet Biber bei Bedarf.

### Optional: Overleaf-Galerie

Einreichen über die Overleaf-Oberfläche (nicht allein über GitHub): im Projekt den Workflow für **Vorlagen / Galerie** nutzen. Struktur entspricht üblichen Galerie-Projekten (`main.tex`, `references.bib`, `README.md`, `LICENSE`).

### Optional: GitHub „Use this template“

Im Repository: **Settings** → **General** → **Template repository** aktivieren. Andere können dann mit einem Klick ein neues Repo anlegen — gut kombinierbar mit Overleaf-Import.

## Projektaufbau

| Datei / Ordner   | Rolle |
|------------------|--------|
| `main.tex`       | Hauptquelle (in Overleaf als Hauptdokument setzen). |
| `references.bib` | Beispiel-BibTeX-Datenbank. |
| `img/`           | Abbildungen; `\graphicspath{{img/}}` in `main.tex`. |
| `latexmkrc`      | `latexmk` / Overleaf: pdfLaTeX + Biber. |
| `Makefile`       | Optional: lokaler Build mit `make`. |

## Lokaler Build

Mit `latexmk` (empfohlen):

```bash
latexmk -pdf main.tex
```

Oder manuell:

```bash
pdflatex main.tex
biber main
pdflatex main.tex
pdflatex main.tex
```

Mit GNU Make:

```bash
make
```

## Schrift

Ist das Paket **noto** installiert (u.\,a. typisch auf Overleaf), wird **Noto Sans** als serifenlose Hauptschrift genutzt. Sonst greift die Vorlage auf die Standard-Sans der Distribution zurück.

## Git: Kompilate ignorieren oder PDF zur Vorschau versionieren?

**Empfehlung (aktuell in `.gitignore`):** alle erzeugten Dateien ignorieren, einschließlich **`main.pdf`**. Klone bleiben klein, Diffs lesbar; **Overleaf** (oder `make` / `latexmk`) erzeugt das PDF stets aus `main.tex`.

**PDF-Vorschau auf GitHub:** Zeile `*.pdf` in `.gitignore` entfernen, `make` ausführen (oder in Overleaf kompilieren und `main.pdf` herunterladen), **`main.pdf` committen**. Bei Layout-Änderungen PDF neu bauen und erneut committen. Hilfsdateien (`.aux`, `.log`, `.bbl`, …) weiter ignorieren.

## Anpassung des Templates für Einreichungen

- Titel, Autorinnen/Autoren, E-Mail-Adressen, Affiliationen und Fließtext in `main.tex` (ab Zeile 75) bearbeiten.
- Literatur in `references.bib` pflegen; die Datei ist bereits in `main.tex` eingebunden (`\addbibresource{references.bib}`).
