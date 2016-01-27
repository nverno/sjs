##' Flash an alert message bootstrap style
##' Will display the alert in first of the following containers by order
##' of preference: 'flash-container', 'container', 'container-fluid', 'body[0]'.
##' Use the flash-container though, since it will will be styled to come to the top.
##' @title Flash a message
##' @param session session
##' @param text text
##' @param type type: boostrap types ['info', 'warning', 'alert', 'success']
##' @export
flash <- function(session, text, type='info') {
    session$sendCustomMessage(
        type='flash', list(message=text, type=type)
    )
}

##' Called in the UI to create a spot for flashing alerts.
##' @title Create a location to flash messages
##' @param id Optional id of div
##' @param ... Additional arguments passed to flash-container div
##' @export
flashPoint <- function(id='', ...) {
    ftag <- shiny::tags$div(class='flash-container', id=id, ...)
    htmltools::attachDependencies(ftag, sjsDep)
}
