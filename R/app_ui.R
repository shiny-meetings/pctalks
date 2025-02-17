#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import bslib
#' @import rlang
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    page_navbar(
      id = "app_page",
      header = app_banner,
      theme = bs_theme(
        fg =  "black", #"#419599", #"#72994E",
        bg = "white",
        primary = "#72994E",
        secondary = "#419599"
      ) |>
        bs_add_rules("
      .posit_header {
         background-color: #72994E !important;
         color: white;
      }
      .truncate-description {
        height: 150px;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 6;
        -webkit-box-orient: vertical;
      }
    "),
      nav_panel(
        title = tags$span(
          tags$img(
            src = "www/logo.png",
            width = "150px",
            height = "auto",
            class = "me-3",
            alt = "Posit Conf 2024"
          )
        ),
        value = "Home",
        page_sidebar(
          sidebar = sidebar,
          all_talks
        )
      ),
      !!! all_hidden_pages
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "pctalks"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
