library(shiny)
library(yaml)
addResourcePath("www", "www")
tunes <- yaml.load(readLines("tunes.yaml"))

ui <- fluidPage(
  titlePanel("myRealPro"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "reelSelector",
        label = "Reels",
        choices = c("no selection", names(tunes)),
        selected = NULL),
      
      selectInput(
        inputId = "jigSelector",
        label = "Jigs",
        choices = c("no selection", names(tunes)),
        selected = NULL),
      
      selectInput(
        inputId = "swingSelector",
        label = "Swing",
        choices = c("no selection", names(tunes)),
        selected = NULL),
      
      selectInput(
        inputId = "latinSelector",
        label = "Latin",
        choices = c("no selection", names(tunes)),
        selected = NULL)
    ), # sbp
    
    mainPanel(
      uiOutput("reelOutput"),
      uiOutput("jigOutput"),
      uiOutput("swingOutput"),
      uiOutput("latinOutput")
    ) # m
  ) # sbl
) # fp

server <- function(input,output){
  
  output$reelOutput <- renderUI({
    tuneName <- input$reelSelector
    if(tuneName != "no selection"){
      tuneFile <- tunes[[tuneName]]
      tags$img(src=tuneFile, width=500)
    }
  })
  
  output$jigOutput <- renderUI({
    tuneName <- input$jigSelector
    if(tuneName != "no selection"){
      tuneFile <- tunes[[tuneName]]
      tags$img(src=tuneFile, width=500)
    }
  })
  
  output$swingOutput <- renderUI({
    tuneName <- input$swingSelector
    if(tuneName != "no selection"){
      tuneFile <- tunes[[tuneName]]
      tags$img(src=tuneFile, width=500)
    }
  })
  
  output$latinOutput <- renderUI({
    tuneName <- input$latinSelector
    if(tuneName != "no selection"){
      tuneFile <- tunes[[tuneName]]
      tags$img(src=tuneFile, width=500)
    }
  })
}


shinyApp(ui = ui, server = server)