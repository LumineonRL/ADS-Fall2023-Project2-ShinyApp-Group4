server_impacts <- function(input, output, session) {
  #Data Processing: Extract year of original construction
  claims_df$originalConstructionDate <- as.Date(claims_df$originalConstructionDate)
  claims_df$originalConstructionYear <- as.numeric(format(claims_df$originalConstructionDate, "%Y"))
  #Data Processing: Extracting category of Flood Event
  claims_df = claims_df %>%
    mutate(floodEventType = case_when(grepl("hurricane", tolower(floodEvent)) ~ "Hurricane",
                                      grepl("storm", tolower(floodEvent)) ~ "Storm",
                                      grepl("storms", tolower(floodEvent)) ~ "Storm",
                                      grepl("blizzard", tolower(floodEvent)) ~ "Storm",
                                      grepl("flooding", tolower(floodEvent)) ~ "Flood",
                                      grepl("rain", tolower(floodEvent)) ~ "Rain",
                                      grepl("rains", tolower(floodEvent)) ~ "Rain",
                                      .default = "Other"))
  # ========================== stacked bar chart ===========================
  rv <- reactiveValues(update = 0)
  observeEvent(input$StackedBCFilter, {
    rv$update <- input$StackedBCFilter
  })
  
  output$box <- renderPlot({
    library(tidyverse)
    rv$update
    
    if(rv$update == 3) { #Original Construction Year
      claims_df %>%
        count(originalConstructionYear) %>%
        arrange(desc(n)) %>%
        ggplot(aes(x = originalConstructionYear, y = n, fill = n)) +
        geom_bar(stat = "identity") +
        scale_fill_gradient(low = "lightgreen", high = "darkgreen") +
        ylab("Total") +
        xlab("Original Construction Year") +
        labs(title="Flood insurance records by Original Construction Year")
    } else if (rv$update == 2){ #State
      claims_df %>%
        count(state) %>%
        arrange(desc(n)) %>%
        top_n(15) %>%
        ggplot(aes(x = reorder(state, -n), y = n, fill = n)) +
        geom_bar(stat = "identity") +
        scale_fill_gradient(low = "skyblue", high = "darkblue") +
        ylab("Total") +
        xlab("State") +
        labs(title = "Flood insurance records by State")
    } else if (rv$update == 1){ #Flood Event
      claims_df %>%
        count(floodEventType) %>%
        arrange(desc(n)) %>%
        ggplot(aes(x = floodEventType, y = n, fill = n)) +
        geom_bar(stat = "identity") +
        scale_fill_gradient(low = "palevioletred", high = "orchid4") +
        ylab("Total") +
        xlab("Flood Event") +
        labs(title="Flood insurance records by Flood Event")
    }
  })
}