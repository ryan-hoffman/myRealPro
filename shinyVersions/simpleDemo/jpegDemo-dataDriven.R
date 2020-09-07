library(shiny)
library(yaml)
pictures <- yaml.load(readLines("/Users/rhoffman/code/python_misc/myRealPro/shinyVersions/simpleDemo/pictures.yaml"))


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
