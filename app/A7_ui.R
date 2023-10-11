ui <- fluidPage(
  titlePanel("Impact of Flood Insurance Claims"),
  
  tabsetPanel(
    tabPanel("Title", ui_title()),
    tabPanel("Map", ui_map),
    tabPanel("Payout", ui_payout),
    tabPanel("Impacts", ui_impacts),
    tabPanel("Elevation", ui_elevation),
    tabPanel("References", ui_references())
  )
)


