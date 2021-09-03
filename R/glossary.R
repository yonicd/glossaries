#' @importFrom R6 R6Class
#' @importFrom knitr opts_knit
#' @importFrom yaml read_yaml
#' @importFrom stats setNames
#' @importFrom textclean make_plural
#' @importFrom glue glue
glossary <- R6::R6Class(
  classname = "Glossary",
  public = list(
    initialize = function(file = "",...) {
      output <- knitr::opts_knit$get("rmarkdown.pandoc.to")
      if(is.null(output)){
        output <- 'console'
      }
      self$output <- output
    },
    load = function(file = "", ...){
      if(nzchar(file)){
        obj <- parse_entries(yaml::read_yaml(file, ...))

        for(i in seq(length(obj[[1]]))){
          do.call(self$new_entry,obj[[1]][[i]])
        }

        for(i in seq(length(obj[[2]]))){
          do.call(self$new_acronym,obj[[2]][[i]])
        }

      }
    },
    output        = NULL,
    new_entry     = function(entry, name, description, ...){
      this <- private$create_term(
        label       = entry,
        name        = name,
        description = description,
        ...
      )
      this_list <- stats::setNames(list(this),entry)
      private$entries <- append(private$entries,this_list)
      private$counter[[entry]] <- FALSE
    },
    new_acronym   = function(entry, label, long,...){
      this <- private$create_acronym(
        label                   = entry,
        abbrv                   = label,
        long                    = long,
        ...
      )
      this_list <- stats::setNames(list(this),entry)
      private$entries <- append(private$entries,this_list)
      private$counter[[entry]] <- FALSE
    },
    get_entry     = function(entry){
      private$entries[[entry]]
    },
    rm_entry      = function(entry){
      private$entries[[entry]] <- NULL
    },
    update_entry  = function(entry, name, description, ...){
      private$entries[[entry]] <- private$create_term(
        label       = entry,
        name        = name,
        description = description,
        ...
      )
    },
    update_acronym  = function(entry, label, long, ...){
      private$entries[[entry]] <- private$create_acronym(
        label  = entry,
        abbrv  = label,
        long   = long,
        ...
      )
    },
    gls           = function(term){
      private$is_entry(term)
      on.exit(self$bump(term))
        if(self$get_count(term)){
          private$entries[[term]]$name
        }else{
          private$entries[[term]]$first
        }
    },
    glspl = function(term){
      on.exit(self$bump(term))
        if(self$get_count(term)){
          private$entries[[term]]$plural
        }else{
          private$entries[[term]]$first_plural
        }
    },
    Gls = function(term){
      on.exit(self$bump(term))
        if(self$get_count(term)){
          private$firstup(private$entries[[term]]$name)
        }else{
          private$firstup(private$entries[[term]]$first)
        }
    },
    Glspl = function(term){
      on.exit(self$bump(term))
        if(self$get_count(term)){
          private$firstup(private$entries[[term]]$plural)
        }else{
          private$firstup(private$entries[[term]]$first_plural)
        }
    },
    acrshort      = function(term){
        private$entries[[term]]$name
    },
    acrlong = function(term){
        private$entries[[term]]$description
    },
    acrfull = function(term){
        private$entries[[term]]$first
    },
    list_entries  = function(){
      private$entries
    },
    get_count     = function(term){
      private$counter[[term]]
    },
    bump          = function(term){
      private$counter[[term]] <- TRUE
    }
  ),
  private = list(
    create_term = function(type = 'definition',
                           label,
                           name,
                           description,
                           key_list = NULL,
                           text = name,
                           first = name,
                           plural = textclean::make_plural(name),
                           first_plural = textclean::make_plural(name)){
      list(
        type         = type,
        label        = label,
        name         = name,
        description  = description,
        text         = text,
        first        = first,
        plural       = plural,
        first_plural = first_plural,
        `key-list`   = key_list
      )},
    create_acronym = function(label, abbrv, long, key_list = NULL){
      private$create_term(
        type         = 'acronym',
        label        = label,
        name         = abbrv,
        description  = long,
        text         = abbrv,
        key_list     = key_list,
        first        = glue::glue('{long} ({abbrv})'),
        plural       = textclean::make_plural(abbrv),
        first_plural = glue::glue('{textclean::make_plural(long)} ({textclean::make_plural(abbrv)})'))
    },
    entries  = list(),
    firstup  = function(x) {
      substr(x, 1, 1) <- toupper(substr(x, 1, 1))
      x
    },
    counter = list(),
    is_entry  = function(term){
      if(!term%in%names(private$entries)){
        msg <- glue::glue('{term} is not in entries.\nRun entry_names() to view loaded entries')
        stop(msg, call. = FALSE)
      }
    }
  )
  )
