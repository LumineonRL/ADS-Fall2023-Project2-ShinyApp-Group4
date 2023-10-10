ui_payout <- fluidPage(
  titlePanel("Claim Amounts"),
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput("coastal_filter", label = "Include Coastal Data",
                         choices = c("Include Coastal" = TRUE, "Exclude Coastal" = FALSE),
                         selected = c(TRUE, FALSE)),
      checkboxGroupInput("payment_filter", label = "Payment Exceeds Damage",
                         choices = c("Exceeds Damage" = TRUE, "Does Not Exceed Damage" = FALSE),
                         selected = c(TRUE, FALSE)),
      checkboxGroupButtons(
        inputId = "cause_filter",
        label = "Cause of Damage",
        choices = unique(claim_amounts_df$causeOfDamage),
        selected = unique(claim_amounts_df$causeOfDamage),
        direction = "vertical",
        justified = TRUE,
        size = "sm",
        individual = TRUE,
        width = "100%",
        checkIcon = list(
          yes = icon("check"),
          no = icon("square")
        )
      )
    ),
    mainPanel(
      plotlyOutput("claim_plot")
    )
  )
)