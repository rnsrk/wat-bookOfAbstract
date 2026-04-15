# WissKI-Nutzertreffen — Book of Abstract (LaTeX-Vorlage)

LaTeX-Vorlage für \emph{Extended Abstracts} für den Eigennamen \emph{Book of Abstract} (englische Bezeichnung bewusst nicht eingedeutscht): Titel, Autorinnen und Autoren mit hochgestellten Affiliations-Markern, Abschnitte, Fußnoten, Literatur (BibTeX + `natbib`), Block- und Inline-Zitate, Abbildungen, Tabellen und Hyperlinks. **Sprache der Beispieltexte:** Deutsch (modernes **babel** mit `\babelprovide[import, main]{german}` in `main.tex` — kompatibel mit Babel ab ca. Version 24 / TeX Live 2024ff.).

**Lizenz:** [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/deed.de) (siehe `LICENSE`).

## Nutzung in Overleaf (Import von GitHub)

1. Dieses Repository auf **GitHub** legen (öffentlich oder privat).
2. In Overleaf: **Neues Projekt** → **Projekt importieren** → **Von GitHub**.
3. GitHub ggf. autorisieren und das Repository auswählen.
4. **Hauptdokument** auf `main.tex` stellen, falls nicht automatisch: **Menü** → **Hauptdokument** → `main.tex`.
5. **Menü** → **Compiler** → **pdfLaTeX** (empfohlen; entspricht dieser Vorlage).
6. **Recompile**. Literatur und Querverweise können zwei Durchläufe brauchen; Overleafs **latexmk** (mit `latexmkrc`) startet BibTeX bei Bedarf.

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
| `latexmkrc`      | `latexmk` / Overleaf: pdfLaTeX + BibTeX. |
| `Makefile`       | Lokaler Build mit `make` (nur `pdflatex` + `bibtex`, kein `latexmk`). |

## Lokaler Build

Voraussetzungen: **`pdflatex`** und **`bibtex`** (typisch über das TeX-Live-Metapaket der Distribution). **`latexmk`** ist oft eine **eigene** Paketauswahl und fehlt bei Minimalinstallationen — dann meldet die Shell z. B. „Unknown command: latexmk“. Nachinstallieren:

- **Debian / Ubuntu:** `sudo apt install latexmk`
- **Arch Linux** (u. a. Manjaro, CachyOS): `sudo pacman -S texlive-binextra`

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
bibtex main
pdflatex main.tex
pdflatex main.tex
```

Hinweis: Wer TeX Live **manuell** in den Benutzerordner installiert, muss das passende **`bin`**-Verzeichnis in der **`PATH`** der Shell eintragen. Ist `pdflatex` bereits per Distributionspaket verfügbar (z. B. Debian: `texlive-latex-base` / Arch: `texlive-bin`), ist dafür in der Regel **kein** zusätzliches `source`-Setup nötig — fehlendes `latexmk` behebt man durch das passende Zusatzpaket oder durch `make`.

## Schrift

Ist das Paket **noto** installiert (u.\,a. typisch auf Overleaf), wird **Noto Sans** als serifenlose Hauptschrift genutzt. Sonst greift die Vorlage auf die Standard-Sans der Distribution zurück.

## Git: Kompilate ignorieren oder PDF zur Vorschau versionieren?

**Empfehlung (aktuell in `.gitignore`):** alle erzeugten Dateien ignorieren, einschließlich **`main.pdf`**. Klone bleiben klein, Diffs lesbar; **Overleaf** (oder `make` / `latexmk`) erzeugt das PDF stets aus `main.tex`.

**PDF-Vorschau auf GitHub:** Zeile `*.pdf` in `.gitignore` entfernen, `make` ausführen (oder in Overleaf kompilieren und `main.pdf` herunterladen), **`main.pdf` committen**. Bei Layout-Änderungen PDF neu bauen und erneut committen. Hilfsdateien (`.aux`, `.log`, `.bbl`, …) weiter ignorieren.

## Anpassung

- Titel, Autorinnen/Autoren, Affiliationen (Block `\date`) und Fließtext in `main.tex` bearbeiten.
- Literatur in `references.bib` pflegen; `\bibliography{references}` muss zum Dateinamen der `.bib` passen (ohne Endung).
