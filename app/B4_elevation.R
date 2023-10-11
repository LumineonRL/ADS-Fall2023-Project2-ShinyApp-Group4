server_elevation <- function(input, output, session) {
  
  # Reactive expression to filter data based on color selection
  filtered_data <- reactive({
    if (input$color == "None") {
      return(claim_elevation_df)
    } else {
      return(claim_elevation_df[, c(input$x_axis, input$y_axis, input$color), drop = FALSE])  # Use drop = FALSE to preserve the column as data frame
    }
  })
  
  # Create the scatter plot
  output$scatterplot <- renderPlot({
    ggplot(filtered_data(), aes_string(x = input$x_axis, y = input$y_axis, color = input$color)) +
      geom_point() +
      labs(x = input$x_axis, y = input$y_axis, color = input$color)
  })
}