library(shiny)

ryansHTML <- fluidPage(
  fluidRow(
      actionButton(inputId="helloButton", label="Hello!"),
      textOutput(outputId="myTextOutput")
      )
)

ryansEventHandlers <- function(input, output) {

    observeEvent(input$helloButton, {
        output$myTextOutput <- renderText("hello from R")
        print("button clicked")})

}

shinyApp(ui=ryansHTML, server=ryansEventHandlers)


