ui_map <- fluidPage(
  titlePanel("Geospatial Analysis of Flood across States"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("display", "Choose Display:",
                  choices = c("Geographical Location of Flood","Claim Payouts vs Coverage Amount", 
                              "Cause of Damage")),
      selectInput("year", "Select Year of Loss:",
                  choices = c("All Years", sort(unique(claims_df$yearOfLoss))), 
                  selected = "All Years"),
      selectInput("state", "Select State:",
                  choices = c("All States", sort(unique(claims_df$state))), 
                  selected = "All States")  
    ),
    
    mainPanel(
      leafletOutput("map")
    )
  )
)