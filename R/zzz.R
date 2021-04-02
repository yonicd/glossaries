.onLoad <- function(lib,pkg) {
  if(!is.null(rmarkdown::metadata$glossary$file))
    g$load(rmarkdown::metadata$glossary$file)
}
