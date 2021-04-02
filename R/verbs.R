#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param entry PARAM_DESCRIPTION
#' @param name PARAM_DESCRIPTION
#' @param desc PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname add_definition
#' @export

add_definition <- function(entry, name, desc){
  g$new_entry(entry, name, desc)
}

#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param entry PARAM_DESCRIPTION
#' @param label PARAM_DESCRIPTION
#' @param long PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname add_acronym
#' @export

add_acronym <- function(entry, label, long){
  g$new_acronym(entry, label, long)
}

#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param entry PARAM_DESCRIPTION
#' @param name PARAM_DESCRIPTION
#' @param desc PARAM_DESCRIPTION
#' @param type PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname verbs
#' @export

get_entry <- function(entry){
  g$get_entry(entry)
}

#' @rdname verbs
#' @export
remove_entry <- function(entry){
  g$rm_entry(entry)
}

#' @rdname verbs
#' @export
update_entry <- function(entry, name, desc){
  g$update_entry(entry, name, desc)
}

#' @rdname verbs
#' @export
get_entries <- function(type = c('definition','acronym')){
  type <- match.arg(
    type,
    c('definition','acronym'),
    several.ok = TRUE
    )
  ret <- g$list_entries()
  idx <- sapply(ret,'[[',1)%in%type
  ret[idx]
}

#' @rdname verbs
#' @export
entry_names <- function(){
  entries_frame <- as.data.frame(cbind(lapply(get_entries(),'[[',1)))
  entries_frame$V2 <- row.names(entries_frame)
  row.names(entries_frame) <- NULL
  names(entries_frame) <- c('type','name')
  entries_frame
}
