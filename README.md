# WissKI User Meeting — book of abstracts (LaTeX template)

LaTeX template for extended abstracts in a book-of-abstracts style: title, authors with superscript affiliations, sections, footnotes, citations (BibTeX + `natbib`), block and inline quotations, figures, tables, and hyperlinks.

**License:** [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) (see `LICENSE`).

## Use on Overleaf (import from GitHub)

1. Push this repository to **GitHub** (public or private, depending on your needs).
2. In Overleaf: **New project** → **Import project** → **From GitHub**.
3. Authorize GitHub if prompted, then select this repository.
4. After import, set **Main document** to `main.tex` if Overleaf did not pick it automatically: **Menu** → **Main document** → `main.tex`.
5. **Menu** → **Compiler** → **pdfLaTeX** (recommended; matches this template).
6. Click **Recompile**. The first run may need two compiles for references; Overleaf’s **latexmk** (with the included `latexmkrc`) runs BibTeX when needed.

### Optional: publish as an Overleaf gallery template

Gallery submission is done in the Overleaf UI (not via GitHub alone): open the project on Overleaf and follow their **Submit** / gallery template workflow. This repo is structured so that import and compilation work the same way as common gallery projects (`main.tex`, `references.bib`, `README.md`, `LICENSE`).

### Optional: “Use this template” on GitHub

In the GitHub repository: **Settings** → **General** → enable **Template repository**. Others can then generate a new repo from yours with one click, which pairs well with Overleaf imports.

## Project layout

| File / folder   | Role |
|-----------------|------|
| `main.tex`      | Main LaTeX source (set as main document in Overleaf). |
| `references.bib`| Example BibTeX database. |
| `img/`          | Put figure files here; `\graphicspath{{img/}}` is set in `main.tex`. |
| `latexmkrc`     | `latexmk` / Overleaf: pdfLaTeX + BibTeX. |
| `Makefile`      | Optional local build with `make`. |

## Local build

With `latexmk` (recommended):

```bash
latexmk -pdf main.tex
```

Or manually:

```bash
pdflatex main.tex
bibtex main
pdflatex main.tex
pdflatex main.tex
```

With GNU Make:

```bash
make
```

## Fonts

On full TeX installations (including Overleaf), if the `noto` package is present, **Noto Sans** is used as the sans-serif body font. Otherwise the template falls back to the default Computer Modern sans bundle.

## Git: ignore compiled files, or keep a PDF for preview?

**Recommended for this template (current `.gitignore`):** ignore **all** generated files, including **`main.pdf`**. Clones stay small, diffs stay readable, and **Overleaf** (or `make` / `latexmk`) always produces a fresh PDF from `main.tex`.

**If you want a preview PDF on GitHub:** remove the `*.pdf` line from `.gitignore`, run `make` (or compile in Overleaf and download `main.pdf`), then **commit `main.pdf`**. Refresh that file whenever the layout changes so the preview stays accurate. Auxiliary files (`.aux`, `.log`, `.bbl`, …) should stay ignored.

## Customization

- Edit title, authors, affiliations (`\date` block), and body in `main.tex`.
- Add or change bibliography entries in `references.bib`; keep `\bibliography{references}` in sync with the `.bib` filename (without extension).
