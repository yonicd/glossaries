html_entry_first <- function(entry, name, desc){
  htmltools::tags$dfn(
      id = glue::glue('abbr-{entry}'),
      htmltools::tags$abbr(entry, title = name),
      desc
  )
}

html_entry <- function(entry, name){
  htmltools::tags$abbr(entry, title = name)
}
