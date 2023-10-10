server_payout <- function(input, output) {
  output$claim_plot <- renderPlotly({
    # Filter data based on coastal, payment, and cause selection
    filtered_df <- subset(claim_amounts_df, 
                          is_coastal %in% input$coastal_filter & 
                            payment_exceeds_damage %in% input$payment_filter & 
                            (input$cause_filter == "All" | causeOfDamage %in% input$cause_filter))
    
    # Convert causeOfDamage to factor
    filtered_df$causeOfDamage <- factor(filtered_df$causeOfDamage)
    
    # Create ggplot with fixed scale, colored points, and shaped points
    ggplot(filtered_df, aes(x = buildingDamageAmount, y = netBuildingPaymentAmount, color = is_coastal, shape = causeOfDamage)) +
      geom_point(size = 2, aes(fill = is_coastal), stroke = 1) +
      xlab("Building Damage Amount") +
      ylab("Net Building Payment Amount") +
      theme_minimal() +
      coord_cartesian(xlim = c(0, max(claim_amounts_df$buildingDamageAmount)),
                      ylim = c(0, max(claim_amounts_df$netBuildingPaymentAmount))) +
      scale_color_manual(values = c("FALSE" = "black", "TRUE" = brewer.pal(9, "Set1")[1:2])) +
      scale_fill_manual(values = c("FALSE" = alpha("white", 0), "TRUE" = alpha(brewer.pal(9, "Set1")[1:2], 0.5))) +
      guides(shape = guide_legend(override.aes = list(fill = "black"))) +
      theme(legend.key = element_blank())
  })
}