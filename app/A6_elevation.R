ui_elevation <- 
  tabPanel(
    "Elevation Analysis",fluidPage(
      titlePanel("Elevation Impact on Claims"),
      sidebarLayout(
        sidebarPanel(
          selectInput("x_axis", "Elevation Metric", choices = c('elevationDifference', 'baseFloodElevation', 'lowestFloorElevation')),
          selectInput("y_axis", "Claims Metric", choices = c('amountPaidOnBuildingClaim', 'buildingDamageAmount', 'totalBuildingInsuranceCoverage', 'netBuildingPaymentAmount')),
          selectInput("color", "Building/Damage Type", choices = c('causeOfDamage', 'occupancyType'))
        ),
        mainPanel(
          plotOutput("scatterplot")
        )
      )
    )
  )