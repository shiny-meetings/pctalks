#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {


  ## Forward and Back buttons are enabled ------
  observeEvent(session$clientData$url_hash, {
    currentHash <- sub("#", "", session$clientData$url_hash)
    if(is.null(input$app_page) || !is.null(currentHash) && currentHash != input$app_page){
      freezeReactiveValue(input, "app_page")
      updateTabsetPanel(session, "app_page", selected = currentHash)
    }
  }, priority = 1)

  ## push changes to the sub-URL to the browser history so that back/forward browser buttons work
  observeEvent(input$app_page, {
    currentHash <- sub("#", "", session$clientData$url_hash) # might need to wrap this with `utils::URLdecode` if hash contains encoded characters (not the case here)
    pushQueryString <- paste0("#", input$app_page)
    if(is.null(currentHash) || currentHash != input$app_page){
      freezeReactiveValue(input, "app_page")
      updateQueryString(pushQueryString, mode = "push", session)
    }
  }, priority = 0)


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
