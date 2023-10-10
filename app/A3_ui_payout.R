ui_payout <- fluidPage(
  titlePanel("Claim Amounts"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("year_of_loss", "Year of Loss:",
                  min = min(claim_amounts_df$yearOfLoss),
                  max = max(claim_amounts_df$yearOfLoss),
                  value = c(min(claim_amounts_df$yearOfLoss), max(claim_amounts_df$yearOfLoss)),
                  step = 1),
      
      selectInput("deductible_code", "Building Deductible Code:",
                  choices = unique(claim_amounts_df$buildingDeductibleCode),
                  selected = NULL),
      
      selectInput("cause_of_damage", "Cause of Damage:",
                  choices = unique(claim_amounts_df$causeOfDamage),
                  selected = NULL)
    ),
    
    mainPanel(
      plotlyOutput("claim_plot1"),
      plotlyOutput("claim_plot2")
    )
  )
)