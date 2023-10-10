ui <- fluidPage(
  titlePanel("Impacts on Disaster Insurance Claims"),
  
  tabsetPanel(
    tabPanel("Title", ui_title()),
    tabPanel("Payout", ui_payout),
    tabPanel("Map", ui_map),
    tabPanel("Impacts", ui_impacts),
    tabPanel("References", ui_references())
  )
)


