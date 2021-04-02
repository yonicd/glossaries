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
#' @rdname acr_verbs
#' @export

acrshort <- function(term){
  g$acrshort(term)
}

#' @rdname acr_verbs
#' @export
acrfull <- function(term){
  g$acrfull(term)
}

#' @rdname acr_verbs
#' @export
acrlong <- function(term){
  g$acrlong(term)
}
