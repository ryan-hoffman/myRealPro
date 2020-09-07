# loads the shiny package and makes sit available for use by the script
library(shiny)

# names the ui 'ryansHTML'
# fluidPage() creates a page that adjusts to user's browser window
ryansHTML <- fluidPage(
  # fluidRow() creates a row that adjusts to user's browser window and is part of a layout grid system  
  fluidRow(
    # actionButton() creates an HTML button and takes two arguments: inputId and label
    #actionButtone() works with observeEvent()
    actionButton(inputId="helloButton", label="Hello!"),
    #textOutput() prints text and creates HTML div for the output from observeEvent()
    textOutput(outputId="myTextOutput")
  )
)

# names the server funtion 'ryansEventHandlers'
# function() requires two arguments, input and output that are assigned in the function observeEvent()
ryansEventHandlers <- function(input, output) {
  # observeEvent contains the function called by the actionButton in the ui
  # input$helloButton assigns the event of clicking the action button to this observeEvent()
  observeEvent(input$helloButton, {
    # output$myTextOutput assigns the output from the renderText() to the textOutput() in the ui
    # renderText() prints the text in the app
    output$myTextOutput <- renderText("hello from R")
    # prints 'button clicked' in the console
    print("button clicked")})
  
}
# runs the app assigning the names given to the ui and the server functions
shinyApp(ui=ryansHTML, server=ryansEventHandlers)

