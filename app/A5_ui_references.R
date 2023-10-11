ui_references <- function() {
  tabPanel(
    "References",
    tags$h2("Data Sources"),
    tags$a(href = "https://www.fema.gov/openfema-data-page/fima-nfip-redacted-claims-v2",
           "OpenFEMA Insurance Claim Data"),
    tags$h2("Contributors"),
    tags$p("Wenhe Chen"), tags$p("Daniel Lam"), tags$p("Heze Ma"), tags$p("Shreya Verma"), tags$p("Michael Wiley"),
    tags$h2("GitHub Repository"),
    tags$a(href = "https://github.com/LumineonRL/ADS-Fall2023-Project2-ShinyApp-Group4",
           "https://github.com/LumineonRL/ADS-Fall2023-Project2-ShinyApp-Group4")
  )
}