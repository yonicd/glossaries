#' @title Glossary actions
#' @description Add, remove,  update or retrieve terms in the glossary.
#' @param entry character, entry name
#' @param name character, short name
#' @param desc character, long description
#' @return NULL
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname verbs
#' @family verbs
#' @export

add_definition <- function(entry, name, desc){
  g$new_entry(entry, name, desc)
}

#' @rdname verbs
#' @export

add_acronym <- function(entry, name, desc){
  g$new_acronym(entry, name, desc)
}

#' @rdname verbs
#' @export
update_entry <- function(entry, name, desc){
  g$update_entry(entry, name, desc)
}

#' @rdname verbs
#' @export
remove_entry <- function(entry){
  g$rm_entry(entry)
}

#' @title Query Glossary
#' @description Query glossary entries
#' @param entry character, entry name
#' @param type character, term type 'definition' or 'acronym'
#' @return
#' `get_entry()` returns a list with contents of a single entry
#'
#' `get_entries()` returns a list of entries by type
#'
#' `entry_name()` returns a character vector of the stored entries
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname query
#' @family query
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

#' @rdname query
#' @export

get_entry <- function(entry){
  g$get_entry(entry)
}

#' @rdname query
#' @export
entry_names <- function(){
  entries_frame <- as.data.frame(cbind(lapply(get_entries(),'[[',1)))
  entries_frame$V2 <- row.names(entries_frame)
  row.names(entries_frame) <- NULL
  names(entries_frame) <- c('type','name')
  entries_frame
}

#' @title Query Used Terms in Document
#' @description Query used glossary entries
#' @param type character, term type 'definition' or 'acronym'
#' @return
#' returns a list of entries by type used in the document
#' @export
used_entries <- function(type = c("definition", "acronym")){
  entries <- get_entries(type)
  objs <- sapply(entries,'[[',1)
  flags <- sapply(names(objs),g$get_count,simplify = TRUE)
  entries[flags]
}
