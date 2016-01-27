library(shiny)
library(sjs)

ui <- shinyUI(
    pageWithSidebar(
        flashPoint()
        sidebarLayout(
            sidebarPanel(
                textInput('fmessage', 'Message', placeholder = 'Heyo'),
                selectInput('ftype', 'Type', choices = c('success', 'info',
                                                         'warning', 'alert')),
                ## numericInput('ftime', 'Time', 1e3, 5e3, value=2e3),
                actionButton('fsend', 'Send')
            ),
            mainPanel(
                plotOutput('plot')
            )
        )
    )
)

server <- shinyServer(function(session, input, output) {
    output$plot <- renderPlot( hist(rnorm(1000)) )
    
    ## Send some alerts
    observeEvent('fsend', flash(session, text=input$fmess, type=input$ftype))
})

shinyApp(ui, server)
