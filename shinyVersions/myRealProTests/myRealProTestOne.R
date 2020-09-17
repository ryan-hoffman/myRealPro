library(shiny)
addResourcePath("www", "www");

celtic_reels = list(
  "Congress Reel" = "www/congress.jpg",
  "Earl's Chair" = "www/earlschair.jpg",
  "Mulqueen's Reel" = "www/mulqueens.jpg",
  "Traveler's" = "www/travelers.jpg"
)

celtic_jigs = list(
  "Blarney Pilgrim" = "www/blarney_pilgrim.jpg",
  "Champion" = "www/champion.jpg",
  "Geese in the Bog" = "www/geese_in_the_bog.jpg",
  "Leitrim Fancy" = "www/leitrim_fancy.jpg"
)

swing_tunes = list(
  "After You've Gone" = "www/after_youve_gone.jpg",
  "Ain't Misbehavin'" = "www/aint_misbehavin.jpg",
  "All of Me" = "www/all_of_me.jpg",
  "All the Things You Are" = "www/all_the_things_you_are.jpg"
)

latin_tunes = list(
  "Gentle Rain" = "www/gentle_rain.jpg",
  "Mambo Inn" = "www/mambo_inn.jpg",
  "Manha de Carnival" = "www/manha_de_carnival.jpg"
)

ui <- fluidPage(
  titlePanel("myRealPro"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "reelSelector",
        label = "Reels",
        choices = c("no selection", names(celtic_reels)),
        selected = NULL),

      selectInput(
        inputId = "jigSelector",
        label = "Jigs",
        choices = c("no selection", names(celtic_jigs)),
        selected = NULL),
      
      selectInput(
        inputId = "swingSelector",
        label = "Swing",
        choices = c("no selection", names(swing_tunes)),
        selected = NULL),
      
      selectInput(
        inputId = "latinSelector",
        label = "Latin",
        choices = c("no selection", names(latin_tunes)),
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
      tuneFile <- celtic_reels[[tuneName]]
      tags$img(src=tuneFile, width=500)
    }
  })

  output$jigOutput <- renderUI({
    tuneName <- input$jigSelector
    if(tuneName != "no selection"){
      tuneFile <- celtic_jigs[[tuneName]]
      tags$img(src=tuneFile, width=500)
    }
  })
  
  output$swingOutput <- renderUI({
    tuneName <- input$swingSelector
    if(tuneName != "no selection"){
      tuneFile <- swing_tunes[[tuneName]]
      tags$img(src=tuneFile, width=500)
    }
  })
  
  output$latinOutput <- renderUI({
    tuneName <- input$latinSelector
    if(tuneName != "no selection"){
      tuneFile <- latin_tunes[[tuneName]]
      tags$img(src=tuneFile, width=500)
    }
  })
}

shinyApp(ui = ui, server = server)
