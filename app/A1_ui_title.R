ui_title <- function() {
  fluidPage(
    includeCSS("styles.css"),
    div(class = "title-container",
        h1(class = "title-text", "Impacts of Disaster Insurance Claims")
    )
  )
}
