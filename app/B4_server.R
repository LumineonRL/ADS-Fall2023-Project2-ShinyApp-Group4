server <- function(input, output, session) {
  server_payout(input, output)
  server_map(input, output)
  server_impacts(input, output, session)
}