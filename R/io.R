#' @rdname glossary_utils
#'@export
glossary_to_yaml <- function(file, ...){
  x <- get_entries()
  idx <- sapply(x,'[[',1)%in%'definition'
  names(x) <- NULL

  out <- list(
    definitions = lapply(x[idx],function(xx){
      xx[c('label', 'name', 'description')]
    }),
    acronyms = lapply(x[!idx],function(xx){
      ret <- xx[c('label', 'name', 'description')]
      names(ret) <- c('label','abbrv','long')
      ret
    })
  )

  yaml::write_yaml(out,file, ...)
}

parse_entry <- function(obj){

  idx <- which(sapply(obj,function(x) grepl('^`r',x)))
  list2env(obj, envir = environment())
  for(i in idx){
    txt <- gsub('^`r |`$','',obj[[i]])
    obj[[i]] <- eval(parse(text = txt))
  }
  obj
}

parse_entries <- function(obj){
  lapply(obj,function(x) lapply(x,parse_entry))
}
