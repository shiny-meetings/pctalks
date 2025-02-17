#' @import dplyr
#' @import tidyr
#' @import shiny
#' @import bslib
data(combined_data_collapsed, envir=environment())

list_combined_data_collapsed <- unname(split(combined_data_collapsed, seq(nrow(combined_data_collapsed))))

all_hidden_pages <- lapply(
  list_combined_data_collapsed,
  create_talk_page
)




speakers <- combined_data_collapsed$speaker_name
combined_data_collapsed <- combined_data_collapsed |>
  dplyr::mutate(
    session_topics = dplyr::case_when(
      session_topics == "NA" ~ "Keynote & Lightning Talks",
      .default = session_topics
    ),
    description = dplyr::case_when(
      is.na(description) ~ "No Description",
      .default = description
    )
  )
topics <- lapply(combined_data_collapsed$session_topics, \(string){
  unlist(strsplit(string, ",\\s*"))
})

page_value <- combined_data_collapsed$page_value
talk_title <- combined_data_collapsed$talk_title
description <- combined_data_collapsed$description

all_cards <- Map(f = create_talk_card, talk_title, speakers, topics, page_value, description)


all_talks <- tags$div(
  class = "row",
  all_cards
)

# all_talks <- bslib::layout_column_wrap(all_cards, width = 1/3)

topic_input <- checkboxGroupInput(
  inputId = "topics",
  label = "Session Topics",
  choices = topics |> unlist() |> unique(),
  selected = NULL
)

search_input <- textInput(
  inputId = "search_term",
  label = NULL,
  placeholder = "Search by speaker"
)


sidebar <- sidebar(
  search_input,
  topic_input,
  open = TRUE
)
