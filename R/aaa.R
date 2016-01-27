.onAttach <- function(...) {
    shiny::addResourcePath('sjs', system.file('www', package='sjs'))
}

sjsDep <- htmltools::htmlDependency('sjs', packageVersion('sjs'), 
                                    src=c('href'='sjs'), 
                                    script='flash.js',
                                    stylesheet='flash.css')
