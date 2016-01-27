library(shiny)
library(sjs)

ui <- shinyUI(
    fluidPage(
        flashPoint(),
        titlePanel('Test flash messages'),
        sidebarLayout(
            sidebarPanel(
                textInput('fmessage', 'Message', value = 'Heyo'),
                selectInput('ftype', 'Type', choices = c('success', 'info',
                                                         'warning', 'danger')),
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
    observeEvent(input$fsend, flash(session, text=input$fmessage, type=input$ftype))
})

shinyApp(ui, server)
