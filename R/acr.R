#' @title Inline Acronym Verbs
#' @description Verbs to invoke inline outputs for acronyms
#' @param term character, name of the term.
#' @return character
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @rdname acr_verbs
#' @family inline
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
