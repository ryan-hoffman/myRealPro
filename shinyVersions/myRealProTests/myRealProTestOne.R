library(shiny)

celtic_tunes = list(
  "Congress Reel" = "congress.jpg",
  "Earl's Chair" = "earlschair.jpg",
  "Mulqueen's Reel" = "mulqueens.jpg",
  "Traveler's" = "travelers.jpg"
)

jazz_tunes = list(
  "After You've Gone" = "after_youve_gone.jpg",
  "Ain't Misbehavin'" = "aint_misbehavin.jpg",
  "All of Me" = "all_of_me.jpg",
  "All the Things You Are" = "all_the_things_you_are.jpg"
)

ui <- fluidPage(
  titlePanel("myRealPro"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "celticTuneSelector",
        label = "Celtic Tunes",
        choices = c("no selection", names(celtic_tunes)),
        selected = NULL),
      
      selectInput(
        inputId = "jazzTuneSelector",
        label = "Jazz Tunes",
        choices = c("no selection", names(jazz_tunes)),
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
      tuneFile <- celtic_tunes[[tuneName]]
      tags$img(src=tuneFile, width=500)
    }
  })
  
  output$jazzTuneOutput <- renderUI({
    tuneName <- input$jazzTuneSelector
    if(tuneName != "no selection"){
      tuneFile <- jazz_tunes[[tuneName]]
      tags$img(src=tuneFile, width=500)
    }  
  })
}

shinyApp(ui = ui, server = server)