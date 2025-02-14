#' Create a talk page
#'
#' @param page_data Data for a talk page
#'
#' @returns div
#' @export
create_talk_page <- function(page_data){
  bslib::nav_panel_hidden(
    value = page_data$page_value,
    bslib::layout_columns(
      col_widths = c(-1, 10, -1),
      bslib::card(
        min_height = "1200px",
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




#' Create session topic selection conditions
#'
#' @param topics Vector of session topics
#'
#' @returns string that contains javascript code for session topic conditions
#' @export
create_topic_conditions <- \(topics) {
  paste0("(input.topics.length === 0 || input.topics.some(t => ['",
         paste0(topics, collapse = "', '"), "'].includes(t)))")
}


#' Create search term conditions
#'
#' @param speaker speaker name
#'
#' @returns string that contains javascript code for search term conditions
#' @export
create_speaker_conditions <- \(speaker) {
  paste0("(input.search_term.length === 0 || '",
         tolower(speaker), "'.includes(input.search_term.toLowerCase()))")
}



#' Create talk card
#'
#' @param speaker speaker name
#' @param topics session topics
#'
#' @returns conditional panel
#' @export
create_talk_card <- \(talk_title, speaker, topics, page_value) {
  # topic_li <- lapply(topics, tags$li)
  # topic_ul <- tags$ul(topic_li)

  # card <- tags$div(
  #   class = "card",
  #   tags$div(
  #     class = "card-body",
  #     tags$h4(speaker)#,
  #     # topic_ul
  #   )
  # )

  bslib_card <- bslib::card(
    min_height = "200px",
    bslib::card_header(
      tags$h4(talk_title)
    ),
    bslib::card_body(
      tags$h6(speaker),
      actionButton(
        inputId = page_value,
        label = "REPLAY SESSION"
      )
    )
  )

  col <- tags$div(
    class = "col-12 col-md-4",
    bslib_card #card
  )

  # Use `&&` so both filters must match
  conditions <- paste(
    create_topic_conditions(topics),
    create_speaker_conditions(speaker),
    sep = " && "
  )

  conditionalPanel(
    condition = conditions,
    col
  )
}
