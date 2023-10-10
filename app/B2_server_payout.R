server_payout <- function(input, output) {
  
  filtered_df <- reactive({
    claim_amounts_df %>%
      filter(yearOfLoss >= input$year_of_loss[1],
             yearOfLoss <= input$year_of_loss[2],
             buildingDeductibleCode %in% input$deductible_code,
             causeOfDamage %in% input$cause_of_damage)
  })
  
  output$claim_plot1 <- renderPlotly({
    n_colors <- length(unique(filtered_df()$yearOfLoss))
    colors <- colorRampPalette(brewer.pal(n_colors, "Set1"))(n_colors)
    
    ggplotly(
      ggplot(filtered_df(), aes(x = amountPaidOnBuildingClaim, y = amountPaidOnContentsClaim, 
                                text = paste("Building Claim: ", amountPaidOnBuildingClaim, "<br>Contents Claim: ", amountPaidOnContentsClaim),
                                color = as.factor(yearOfLoss),
                                shape = as.factor(buildingDeductibleCode),
                                size = as.factor(causeOfDamage))) +
        geom_point() +
        xlab("Amount Paid on Building Claim") +
        ylab("Amount Paid on Contents Claim") +
        scale_color_manual(values = colors) +
        scale_shape_manual(values = c(16, 17, 18, 19, 20)) +
        scale_size_manual(values = c(1, 2, 3, 4, 5))
    ) %>% 
      layout(hoverlabel = list(bgcolor = "white", font = list(size = 12)))
  })
  
  output$claim_plot2 <- renderPlotly({
    n_colors <- length(unique(filtered_df()$yearOfLoss))
    colors <- colorRampPalette(brewer.pal(n_colors, "Set1"))(n_colors)
    
    ggplotly(
      ggplot(filtered_df(), aes(x = totalBuildingInsuranceCoverage, y = totalContentsInsuranceCoverage, 
                                text = paste("Building Coverage: ", totalBuildingInsuranceCoverage, "<br>Contents Coverage: ", totalContentsInsuranceCoverage),
                                color = as.factor(yearOfLoss),
                                shape = as.factor(buildingDeductibleCode),
                                size = as.factor(causeOfDamage))) +
        geom_point() +
        xlab("Total Building Insurance Coverage") +
        ylab("Total Contents Insurance Coverage") +
        scale_color_manual(values = colors) +
        scale_shape_manual(values = c(16, 17, 18, 19, 20)) +
        scale_size_manual(values = c(1, 2, 3, 4, 5))
    ) %>% 
      layout(hoverlabel = list(bgcolor = "white", font = list(size = 12)))
  })
}