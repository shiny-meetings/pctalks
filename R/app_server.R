#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  observeEvent(input$go_to_page, {
    bslib::nav_select("app_page", selected = "page1", session = session)
  })
}
