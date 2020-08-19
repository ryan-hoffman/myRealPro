library(shiny)

pictures <- list(a="http://pshannon.net/sewardParkRestoration/fairyTree/leftSideLookingBackTowardsTrail.jpg",
                 b="http://pshannon.net/sewardParkRestoration/fairyTree/beyondRootBall-afterMulching.jpg",
                 c="http://pshannon.net/sewardParkRestoration/fairyTree/rightSide-afterMulching.jpg")

ui = fluidPage(
   titlePanel("Picture Choosing Demo"),
   sidebarLayout(
     sidebarPanel(
         selectInput(inputId="pictureSelector",
                     label="Select Picture",
                     choices=c("no picture", names(pictures)),
                     selected=NULL)
         ),
      mainPanel(
        uiOutput("pictureOutput")
        )
    ) # sidebarPanel
  ) # fluidPage

server = function(input, output) {
    output$pictureOutput <- renderUI({
      pictureName <- input$pictureSelector
      if(pictureName != "no picture"){
         pictureURL <- pictures[[pictureName]]
         tags$img(src=pictureURL, width=300)
         } # if
    }) # renderUI
  } # server

runApp(shinyApp(ui, server), port=8888)
