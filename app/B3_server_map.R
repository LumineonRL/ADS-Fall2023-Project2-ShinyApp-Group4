server_map <- function(input, output) {
  
  # Define the mapping for cause of damage
  cause_mapping <- c(
    "0" = "Other causes",
    "1" = "Tidal water overflow",
    "2" = "Stream, river, or lake overflow",
    "3" = "Alluvial fan overflow",
    "4" = "Accumulation of rainfall or snowmelt",
    "7" = "Erosion-demolition",
    "8" = "Erosion-removal",
    "9" = "Earth movement, landslide, land subsidence, sinkholes, etc.",
    "A" = "Closed basin lake",
    "B" = "Expedited claim handling process without site inspection",
    "C" = "Expedited claim handling process follow-up site inspection",
    "D" = "Expedited claim handling process by Adjusting Process Pilot Program (Remote Adjustment)"
  )
  
  output$map <- renderLeaflet({
    # Start filtering from the full claims_dfset
    filtered_claims_df <- claims_df
    
    if (input$year != "All Years") {
      filtered_claims_df <- subset(filtered_claims_df, yearOfLoss == input$year)
    }
    if (input$state != "All States") {
      filtered_claims_df <- subset(filtered_claims_df, state == input$state)
    }
    
    m <- leaflet(data = filtered_claims_df) %>%
      addTiles() %>%
      setView(lng = -98.35, lat = 39.50, zoom = 4)
    
    if(input$display == "Claim Payouts vs Coverage Amount") {
      # Assuming "amountPaidOnBuildingClaim" as claim payouts and "totalBuildingInsuranceCoverage" as coverage amount
      ratio <- filtered_claims_df$amountPaidOnBuildingClaim / filtered_claims_df$totalBuildingInsuranceCoverage
      pal <- colorQuantile("YlGnBu", ratio, n = 5)
      m <- addCircleMarkers(m, ~longitude, ~latitude, 
                            color = ~pal(ratio),
                            radius = 3, 
                            fillOpacity = 0.5,
                            popup = ~paste("Payout/Coverage Ratio:", round(ratio, 2)))
    } else if(input$display == "Geographical Location of Flood") {
      m <- addCircleMarkers(m, ~longitude, ~latitude, 
                            color = "red", 
                            radius = 3, 
                            fillOpacity = 0.5,
                            popup = ~paste("Longitude:", longitude, "<br>Latitude:", latitude))
      
    } else if(input$display == "Cause of Damage") {
      pal <- colorFactor("Set1", levels(filtered_claims_df$causeOfDamage))
      m <- addCircleMarkers(m, ~longitude, ~latitude, 
                            color = ~pal(causeOfDamage),
                            radius = 3, 
                            fillOpacity = 0.5,
                            popup = ~paste("Cause:", cause_mapping[as.character(causeOfDamage)]))
    } else {
      m <- addCircleMarkers(m, ~longitude, ~latitude, 
                            color = "red", 
                            radius = 3, 
                            fillOpacity = 0.5,
                            popup = ~paste("Longitude:", longitude, "<br>Latitude:", latitude))
    }
    
    m
  })
}