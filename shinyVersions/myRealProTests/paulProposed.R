library(shiny)
library(yaml)
addResourcePath("www", "www")

#--------------------------------------------------------------------------------
# read the yaml file, do some not-initially-obvious manipulations, turn
# it into a readily usable data.frame.  take them on faith for nowm, learn
# details later if and when they become important
#--------------------------------------------------------------------------------
config.file <- "paul.yaml"
config <-  yaml.load(readLines(config.file))
tunes <- config$tunes
tbl.config <- do.call(rbind,
               lapply(tunes,
                      function(tune) as.data.frame(tune, stringsAsFactors=FALSE)
               ))
#--------------------------------------------------------------------------------

ui <- fluidPage(
  titlePanel("myRealPro"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "reelSelector",
        label = "Reels",
        choices = c("no selection", subset(tbl.config, genre=="Irish" & timeSignature=="4/4")$name),
        selected = NULL),

      selectInput(
        inputId = "jigSelector",
        label = "Jigs",
        choices = c("no selection", subset(tbl.config, genre=="Irish" & timeSignature=="6/8")$name),
        selected = NULL),
      
      selectInput(
        inputId = "hornpipeSelector",
        label = "Hornpipes",
        choices = c("no selection", subset(tbl.config, genre=="Irish" & timeSignature=="lilting 4/4")$name),
        selected = NULL),

      selectInput(
        inputId = "swingSelector",
        label = "Swing",
        choices = c("no selection", subset(tbl.config, genre=="swing")$name),
        selected = NULL),

      selectInput(
        inputId = "latinSelector",
        label = "Latin",
        choices = c("no selection", subset(tbl.config, genre=="latin")$name),
        selected = NULL)
    ), # sbp

    mainPanel(
      uiOutput("reelOutput"),
      uiOutput("jigOutput"),
      uiOutput("hornpipeOutput"),
      uiOutput("swingOutput"),
      uiOutput("latinOutput")
    ) # m
  ) # sbl
) # fp

server <- function(input, output, session){

  output$reelOutput <- renderUI({
     tuneName <- input$reelSelector
     print("reelOutput triggered")
     if(tuneName != "no selection"){
       tuneURL <- subset(tbl.config, name==tuneName)$url
       tags$img(src=tuneURL, width=500)
       }
     })

  output$jigOutput <- renderUI({
     tuneName <- input$jigSelector
     print("jigOutput triggered")
     if(tuneName != "no selection"){
       tuneURL <- subset(tbl.config, name==tuneName)$url
       tags$img(src=tuneURL, width=500)
       }
     })
  
  output$hornpipeOutput <- renderUI({
    tuneName <- input$hornpipeSelector
    print("hornpipeOutput triggered")
    if(tuneName != "no selection"){
      tuneURL <- subset(tbl.config, name==tuneName)$url
      tags$img(src=tuneURL, width=500)
    }
  })

  output$swingOutput <- renderUI({
     tuneName <- input$swingSelector
     print("swingOutput triggered")
     if(tuneName != "no selection"){
       tuneURL <- subset(tbl.config, name==tuneName)$url
       tags$img(src=tuneURL, width=500)
       }
     })

  output$latinOutput <- renderUI({
     tuneName <- input$latinSelector
     print("latinOutput triggered")
     if(tuneName != "no selection"){
       tuneURL <- subset(tbl.config, name==tuneName)$url
       tags$img(src=tuneURL, width=500)
       }
     })

}

runApp(shinyApp(ui = ui, server = server), port=9999)

