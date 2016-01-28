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
                helpText('Time of "0" means the message stays until closed.'),
                numericInput('ftime', 'Time', min=0, max=10, value=2),
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
    observeEvent(input$fsend, 
                 flash(session, text=input$fmessage, type=input$ftype,
                       duration=input$ftime))
})

shinyApp(ui, server)
