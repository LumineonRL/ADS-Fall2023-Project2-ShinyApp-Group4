ui_impacts <-
  tabPanel(
    "Filtered Plot",fluidPage(
      sidebarLayout(position = "left",
                    sidebarPanel(h3("Select a filter:", align = "left", style="color:#045a8d"),
                                 radioButtons("StackedBCFilter", 
                                              label = h3("Filter"), 
                                              choices = list("Flood Event" = 1,
                                                             "State" = 2, 
                                                             "Original Construction Year" = 3), 
                                              selected = 1)),
                    mainPanel(plotOutput("box"))))
  )