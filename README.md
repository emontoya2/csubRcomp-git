# An R companion

A freely available companion for learning R alongside undergraduate regression analysis. The first two chapters introduce R, RStudio, and basic R functions; the third covers regression. Use a learn-by-doing approach: run the examples and explore their results.

[Read the published book](https://emontoya2.github.io/csubRcomp-git/).

## Set up a local build

Install R and either RStudio (which includes Pandoc) or a standalone Pandoc installation. Clone this repository and run all commands below from its root. In RStudio, open `Rcomp.Rproj`.

Install dependencies from `DESCRIPTION` in the R console:

```r
install.packages("pak", repos = "https://cloud.r-project.org")
pak::local_install_deps(upgrade = FALSE)
```

This installs dependencies without installing the book as an R package. Bookdown comes from its released version rather than a development GitHub version. Package versions are not locked; builds can change when dependencies change.

## Build and preview

From a terminal with Rscript available:

```sh
Rscript scripts/build.R html
```

The script checks required packages and Pandoc, then renders the chapters listed in `_bookdown.yml`. Output goes to `docs/`; open `docs/index.html` to preview it. The default format is HTML, so `Rscript scripts/build.R` works too.

Alternatively, from the RStudio console:

```r
bookdown::render_book("index.Rmd", output_format = "bookdown::gitbook")
```

For other formats:

```sh
Rscript scripts/build.R epub
Rscript scripts/build.R pdf
```

PDF also requires XeLaTeX. One installation option is TinyTeX, run from R:

```r
install.packages("tinytex", repos = "https://cloud.r-project.org")
tinytex::install_tinytex()
```

Restart the terminal after installing TeX if XeLaTeX is not detected.

## Source and publishing

- `index.Rmd`: title, preface, and shared chunk options.
- `01-intro.Rmd`, `02-basics.Rmd`, `03-reg.Rmd`: published chapters.
- `04-aov.Rmd`: draft ANOVA chapter, excluded from the build; it contains regression material that needs review before inclusion.
- `_bookdown.yml`: chapter order, output directory, and per-chapter setup.
- `_output.yml`: HTML, PDF, and EPUB format settings.
- `_commonfuns.R`: packages loaded in each chapter's fresh R session.
- `DESCRIPTION`: required R packages.
- `docs/`: tracked generated website files.

Edit the R Markdown sources, rebuild, and review both source changes and generated `docs/` changes before committing. Building locally does not publish the book; publication depends on the repository's GitHub Pages settings.

## Troubleshooting and validation

Builds execute examples that download data from `www.csub.edu`. Internet access and the availability of those datasets are required. A download error can indicate an unavailable source rather than an R syntax error; inspect the URL reported by the failing chunk.

If a package is missing, rerun dependency installation. If Pandoc is missing, build from RStudio or install Pandoc and make it available on PATH. When calling the script from a standalone terminal, RStudio's bundled Pandoc may not be on PATH.

GitHub Actions runs HTML, PDF, and EPUB builds on pull requests and pushes to `main`. The workflow installs R, Pandoc, dependencies from `DESCRIPTION`, and TinyTeX for PDF. Check the Actions results before merging. Each format is saved as a downloadable Actions artifact for 14 days. After all three formats pass on a source push to `main`, the workflow combines those outputs and commits only `docs/` to a new `publication/book-<run-id>-<attempt>` branch. Review the generated HTML and open a pull request from that branch to `main`; merging it publishes through the existing GitHub Pages setup. The workflow does not merge or publish automatically. Pushes changing only `docs/` skip this workflow to avoid repeated publication branches. Pull-request builds have read-only repository access; only the publication job on `main` has write access.

After editing, render HTML and inspect the introduction, basic examples, regression tables, plots, navigation, and links. Run `git diff --check` to catch whitespace errors. PDF and EPUB should be rendered separately when changes affect those formats.

## Contributions and license

This book is a work in progress. Report errors or suggest improvements through GitHub issues or pull requests. For corrections, identify the chapter and section; for code errors, include the failing example and your R/package versions (`sessionInfo()`). Material contributions will be acknowledged.

All repository content is licensed [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
