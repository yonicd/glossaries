#' @title Inline Verbs
#' @description Inline verbs to create
#'   glossary outputs from loaded glossary object.
#' @param term character, name of the term.
#' @return character
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname gls_verbs
#' @family inline
#' @export
gls <- function(term){
  g$gls(term)
}

#' @rdname gls_verbs
#' @export
glspl <- function(term){
  g$glspl(term)
}

#' @rdname gls_verbs
#' @export
Gls <- function(term){
  g$Gls(term)
}

#' @rdname gls_verbs
#' @export
Glspl <- function(term){
  g$Glspl(term)
}
