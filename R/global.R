data(sysdata, envir=environment())

#' Create a talk page
#'
#' @param page_data Data for a talk page
#'
#' @returns div
#' @export
create_talk_page <- function(page_data){
  bslib::nav_panel(
    title = page_data$page_value,
    bslib::layout_columns(
      col_widths = c(-1, 10, -1),
      bslib::card(
        bslib::card_header(
          shiny::actionLink(paste0("back_to_session_", page_data$page_value),
                     "Back to Session Catalog",
                     icon = shiny::icon("arrow-left"))
        ),
        bslib::card_body(
          shiny::h4(page_data$talk_title),
          shiny::tags$iframe(
            src = paste0("https://www.youtube.com/embed/", page_data$video_id),
            height = "550",
            frameborder = "0",
            allow = "accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture",
            allowfullscreen = TRUE
          ),
          shiny::br(),
          page_data$description,
          shiny::br(),
          shiny::h5("Speakers:"),
          shiny::tags$ul(
            lapply(strsplit(page_data$speaker_name, ", | and ")[[1]],
                   \(speaker) shiny::tags$li(speaker)
            )
          ),
          # shiny::br(),
          shiny::p(shiny::strong("Session Type: "), page_data$session_type),
          shiny::p(shiny::strong("Session Topics: "), page_data$session_topics)
        )
      )
    )
  )
}

#' @import dplyr
#' @import tidyr
combined_data_collapsed <- combined_data |>
  dplyr::group_by(talk_title) |>
  dplyr::mutate(session_topics = paste(session_topics, collapse = ", ")) |>
  dplyr::ungroup() |>
  dplyr::distinct() |>
  dplyr::mutate(video_id = sub("https://youtu.be/", "", yt_url)) |>
  tidyr::drop_na(yt_url)

list_combined_data_collapsed <- unname(split(combined_data_collapsed, seq(nrow(combined_data_collapsed))))

all_hidden_pages <- lapply(
  list_combined_data_collapsed,
  create_talk_page
)
