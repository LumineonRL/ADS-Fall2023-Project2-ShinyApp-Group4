ui <- fluidPage(
  titlePanel("Shiny App"),
  
  tabsetPanel(
    tabPanel("Title", ui_title()),
    tabPanel("Payout", ui_payout),
    tabPanel("Map", ui_map),
    tabPanel("Impacts", ui_impacts),
    tabPanel("References", ui_references())
  )
)