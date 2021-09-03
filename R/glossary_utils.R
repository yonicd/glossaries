g <- glossary$new()

#' @title Input/Output
#' @description Utility functions reading/exporting the glossary
#' @param file character, path to file storing glossary terms. Default: ''
#' @param ... additional arguments passed to [read_yaml][yaml::read_yaml]
#' @return glossary
#' @details
#' new_glossary returns a new glossary object that is separate from
#' the internal glossary object.
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname glossary_utils
#' @family io
#' @export

load_entries <- function(file = "", ...){
  g$load(file, ...)
}

#' @rdname glossary_utils
#' @export
new_glossary <- function(file = '', ...){
  glossary$new(file, ...)
}

table_prep <- function(e){
  ret <- data.frame(
    name = e$name,
    description = e$description,
    stringsAsFactors = FALSE
  )
  attr(ret,'type') <- e$type
  ret
}


#' @title Export glossary to  table format
#' @description Convert the internal glossary object to a data.frame
#' @param entries character, entries to export, Default: get_entries()
#' @return data.frame
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname glossary_to_table
#' @family io
#' @export
glossary_to_table <- function(entries = get_entries()){
  ret <- do.call(rbind,lapply(entries,table_prep))
  row.names(ret) <- NULL
  ret
}

#' @export
#' @importFrom htmltools tagList tags
#' @rdname glossary_to_table
#' @family io
glossary_to_flextable <- function(entries = get_entries()){
  ret <- lapply(entries,table_prep)
  htmltools::tagList(
    htmltools::tags$style(
      '  dl {
    display: flex;
    flex-flow: row wrap;
    border: solid #333;
    border-width: 1px 1px 0 0;
  }
  dt {
    flex-basis: 20%;
    padding: 2px 4px;
    background: #333;
    text-align: right;
    color: #fff;
  }
  dd {
    flex-basis: 70%;
    flex-grow: 1;
    margin: 0;
    padding: 2px 4px;
    border-bottom: 1px solid #333;
  }'
    ),
    htmltools::tags$dl(
      lapply(ret,function(x){
        htmltools::tagList(
          htmltools::tags$dt(x$name),
          htmltools::tags$dd(x$description)
        )
        }
        )
      )
    )
}
