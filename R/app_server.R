#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {

  lapply(
    combined_data_collapsed$page_value,
    \(page){
      observeEvent(input[[page]], {
        bslib::nav_select("app_page", selected = page, session = session)
      })
    }
  )

  lapply(
    combined_data_collapsed$page_value,
    \(page){
      observeEvent(input[[paste0("back_to_session_", page)]], {
        bslib::nav_select("app_page", selected = "Home", session = session)
      })
    }
  )





}
