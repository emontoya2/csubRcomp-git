# Run from the repository root: Rscript scripts/build.R [html|pdf|epub]
args <- commandArgs(trailingOnly = TRUE)
formats <- c(html = "bookdown::gitbook", pdf = "bookdown::pdf_book",
             epub = "bookdown::epub_book")
if (length(args) > 1L || (length(args) == 1L && !args %in% names(formats))) {
  stop("Usage: Rscript scripts/build.R [html|pdf|epub]", call. = FALSE)
}
format <- if (length(args)) args[[1L]] else "html"
if (!all(file.exists(c("DESCRIPTION", "index.Rmd", "_bookdown.yml", "_output.yml")))) {
  stop("Run this script from the repository root.", call. = FALSE)
}
imports <- read.dcf("DESCRIPTION", fields = "Imports")[[1L]]
packages <- trimws(strsplit(imports, ",", fixed = TRUE)[[1L]])
missing <- packages[!vapply(packages, requireNamespace, logical(1), quietly = TRUE)]
if (length(missing)) {
  stop("Missing R packages: ", paste(missing, collapse = ", "),
       ". See dependency installation in README.md.", call. = FALSE)
}
if (!rmarkdown::pandoc_available()) {
  stop("Pandoc is required. Use RStudio or install Pandoc; see README.md.", call. = FALSE)
}
if (format == "pdf" && !nzchar(Sys.which("xelatex"))) {
  stop("PDF builds require XeLaTeX. See README.md for TinyTeX setup.", call. = FALSE)
}
bookdown::render_book("index.Rmd", output_format = unname(formats[[format]]))
