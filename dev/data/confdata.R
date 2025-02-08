# conf2023 <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-01-14/conf2023.csv') |>
#   dplyr::mutate(
#     session_date = lubridate::ymd(session_date),
#     session_start = lubridate::ymd_hm(
#       paste(session_date, session_start),
#       tz = "America/Chicago"
#     ),
#     session_length = as.integer(session_length)
#   )

conf2024 <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-01-14/conf2024.csv') |>
  janitor::clean_names()
