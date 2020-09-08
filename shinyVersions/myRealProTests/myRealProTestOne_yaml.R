# this code doesn't work

library(shiny)
library(yaml)
tunes <- yaml.load(readLines("tunes.yaml"))


ui <- fluidPage(
  titlePanel("myRealPro"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "celticTuneSelector",
        label = "Celtic Tunes",
        choices = c("no selection", names(tunes)),
        selected = NULL),
      
      selectInput(
        inputId = "jazzTuneSelector",
        label = "Jazz Tunes",
        choices = c("no selection", names(tunes)),
        selected = NULL)
    ), # sbp
    
    mainPanel(
      uiOutput("celticTuneOutput"),
      uiOutput("jazzTuneOutput")
    ) # m
  ) # sbl
) # fp

server <- function(input,output){
  
  output$celticTuneOutput <- renderUI({
    tuneName <- input$celticTuneSelector
    if(tuneName != "no selection"){
      tuneFile <- tunes[[tuneName]]
      tags$img(src=tuneFile, width=500)
    }
  })
  
  output$jazzTuneOutput <- renderUI({
    tuneName <- input$jazzTuneSelector
    if(tuneName != "no selection"){
      tuneFile <- tunes[[tuneName]]
      tags$img(src=tuneFile, width=500)
    }  
  })
}

shinyApp(ui = ui, server = server)