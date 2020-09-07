library(shiny)

ryansHTML <- fluidPage(
  
  fluidRow(
    column(width = 12, offset = 1,
           titlePanel("Hola mundo!")
    ),
  ),
  br(),
  fluidRow(
    column(width = 3, offset = 2,
           actionButton(inputId="buttonOne", label="Hola Paulo!")
    ),
    column(width = 4, offset = 2,
           textOutput(outputId="myTextOutput")
    )
  ),
  br(),
  fluidRow(
    column(width = 3, offset = 2,
           actionButton(inputId="buttonTwo", label="Soy Triste!")
    ),
    column(width = 3, offset = 2,
           textOutput(outputId="myNextTextOutput")
    )
  ),
  br(),
  fluidRow(
    column(width = 3, offset = 2,
           actionButton(inputId="buttonThree", label="Perdi mi perro!")
    ),
    column(width = 3, offset = 2,
           textOutput(outputId="myThirdTextOutput")
    )
  ),
  br(),
  fluidRow(
    column(width = 3, offset = 2,
           actionButton(inputId="buttonFour", label="No se!")
    ),
    column(width = 3, offset = 2,
           textOutput(outputId="myFourthTextOutput")
    )
  ),
)


ryansEventHandlers <- function(input, output) {
  
  observeEvent(input$buttonOne, {
    output$myTextOutput <- renderText("Hola Raul! Como estas?")
  })
  observeEvent(input$buttonTwo, {
    output$myNextTextOutput <- renderText("Lo siento!  Por que?")
  })
  observeEvent(input$buttonThree, {
    output$myThirdTextOutput <- renderText("Donde?")
  })
  observeEvent(input$buttonFour, {
    output$myFourthTextOutput <- renderText("Eso es terrible!")
  })
}
shinyApp(ui=ryansHTML, server=ryansEventHandlers)

