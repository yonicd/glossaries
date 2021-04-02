g <- glossary$new()

#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param file PARAM_DESCRIPTION, Default: ''
#' @param ... PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname glossary_utils
#' @export

load_entries <- function(file = "", ...){
  g$load(file, ...)
}

#' @rdname glossary_utils
#' @export
use_glossary <- function(file = '', ...){
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


#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param entries PARAM_DESCRIPTION, Default: get_entries()
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname glossary_to_table
#' @export
glossary_to_table <- function(entries = get_entries()){
  ret <- do.call(rbind,lapply(entries,table_prep))
  row.names(ret) <- NULL
  ret
}
