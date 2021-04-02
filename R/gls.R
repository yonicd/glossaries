#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param term PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname gls_verbs
#' @export
gls <- function(term){
  g$gls(term)
}

#' @rdname gls_verbs
#' @export
Gls <- function(term){
  g$Gls(term)
}

#' @rdname gls_verbs
#' @export
glspl <- function(term){
  g$glspl(term)
}

#' @rdname gls_verbs
#' @export
Glspl <- function(term){
  g$Glspl(term)
}
