library(RSelenium)
library(wdman)
library(rvest)
library(tidyr)
library(dplyr)

# Function to scrape the data for a given URL
scrape_data <- function(url) {
  driver <- rsDriver(
    browser = "firefox",
    verbose = FALSE
  )
  remote_driver <- driver[["client"]]

  # Navigate to the page
  remote_driver$navigate(url)

  # Wait for the content to load
  Sys.sleep(5)  # Give it time to load

  # Get the page source after JavaScript execution
  page_source <- remote_driver$getPageSource()[[1]]

  # Parse with rvest
  loaded_page <- read_html(page_source)

  # Extract the content
  content <- loaded_page %>%
    html_elements("strong") %>%
    html_text()

  topics <- loaded_page %>%
    html_elements(".attribute-SessionTopics") %>%
    html_text()

  stype <- loaded_page %>%
    html_elements(".attribute-SessionType") %>%
    html_text()

  # Clean up
  remote_driver$close()
  driver$server$stop()

  # Clean the extracted data
  content_clean <- content[!content %in% c("", "Session Catalog", "Browse the posit::conf(2024) agenda below!")]
  content_clean <- sub(" -.*", "", content_clean)
  topics_after_colon <- sub(".*: ", "", topics)
  type_after_colon <- sub(".*: ", "", stype)

  if (length(content_clean) > 0) {
    return(data.frame(
      talk_title = content_clean,
      session_type = type_after_colon,
      session_topics = topics_after_colon
    ) %>%
      tidyr::separate_longer_delim(cols = "session_topics", delim = ", "))
  } else {
    return(NULL)
  }

}





urls <- c(
  "https://reg.conf.posit.co/flow/posit/positconf24/publiccatalog/page/publiccatalog/session/1712004520449001rbm2",
  "https://reg.conf.posit.co/flow/posit/positconf24/publiccatalog/page/publiccatalog/session/1712003976619001avNt",
  "https://reg.conf.posit.co/flow/posit/positconf24/publiccatalog/page/publiccatalog/session/1712707493462001KPj8",
  "https://reg.conf.posit.co/flow/posit/positconf24/publiccatalog/page/publiccatalog/session/1712003957019001aS0p",
  "https://reg.conf.posit.co/flow/posit/positconf24/publiccatalog/page/publiccatalog/session/1711986791933001rL5i",
  "https://reg.conf.posit.co/flow/posit/positconf24/publiccatalog/page/publiccatalog/session/1712004520214001rsxW",
  "https://reg.conf.posit.co/flow/posit/positconf24/publiccatalog/page/publiccatalog/session/1712003933811001s83h",
  "https://reg.conf.posit.co/flow/posit/positconf24/publiccatalog/page/publiccatalog/session/1712004081660001s6Bc",
  "https://reg.conf.posit.co/flow/posit/positconf24/publiccatalog/page/publiccatalog/session/1712004520292001rO6c",
  "https://reg.conf.posit.co/flow/posit/positconf24/publiccatalog/page/publiccatalog/session/1712004124994001gOid",
  "https://reg.conf.posit.co/flow/posit/positconf24/publiccatalog/page/publiccatalog/session/1712004520123001r456",
  "https://reg.conf.posit.co/flow/posit/positconf24/publiccatalog/page/publiccatalog/session/1712003906159001eMTZ",
  "https://reg.conf.posit.co/flow/posit/positconf24/publiccatalog/page/publiccatalog/session/1712004520332001rWs6",
  "https://reg.conf.posit.co/flow/posit/positconf24/publiccatalog/page/publiccatalog/session/1712004520486001rVxN",
  "https://reg.conf.posit.co/flow/posit/positconf24/publiccatalog/page/publiccatalog/session/1712004520527001rYhv",
  "https://reg.conf.posit.co/flow/posit/positconf24/publiccatalog/page/publiccatalog/session/1711986837132001Q4tq",
  "https://reg.conf.posit.co/flow/posit/positconf24/publiccatalog/page/publiccatalog/session/1711986881929001eEbl",
  "https://reg.conf.posit.co/flow/posit/positconf24/publiccatalog/page/publiccatalog/session/1711722448948001FQUK",
  "https://reg.conf.posit.co/flow/posit/positconf24/publiccatalog/page/publiccatalog/session/1712004520171001rWU0",
  "https://reg.conf.posit.co/flow/posit/positconf24/publiccatalog/page/publiccatalog/session/1711986820020001vWw8",
  "https://reg.conf.posit.co/flow/posit/positconf24/publiccatalog/page/publiccatalog/session/1712003879414001GYzI",
  "https://reg.conf.posit.co/flow/posit/positconf24/publiccatalog/page/publiccatalog/session/1712004520371001rrCt",
  "https://reg.conf.posit.co/flow/posit/positconf24/publiccatalog/page/publiccatalog/session/1712004041983001s1h4",
  "https://reg.conf.posit.co/flow/posit/positconf24/publiccatalog/page/publiccatalog/session/1712004520411001rz6v",
  "https://reg.conf.posit.co/flow/posit/positconf24/publiccatalog/page/publiccatalog/session/1711986858836001vnVj",
  "https://reg.conf.posit.co/flow/posit/positconf24/publiccatalog/page/publiccatalog/session/1712004520252001r61y",
  "https://reg.conf.posit.co/flow/posit/positconf24/publiccatalog/page/publiccatalog/session/1711988955885001ee9D",
  "https://reg.conf.posit.co/flow/posit/positconf24/publiccatalog/page/publiccatalog/session/1712004520570001r6eL"
)

# Apply the function to all URLs
all_data <- lapply(urls, scrape_data)

# Combine all data into one data frame
combined_data <- do.call(rbind, all_data)

conf2024 <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2025/2025-01-14/conf2024.csv') |>
  janitor::clean_names()


combined_data <- combined_data |>
  fuzzyjoin::stringdist_full_join(conf2024 |>
                                    dplyr::mutate(talk_title = sub(" -.*", "", talk_title)),
                                  by = "talk_title",
                                  max_dist = 5,
                                  method = "lv",
                                  ignore_case = TRUE)



combined_data <- combined_data |>
  mutate(
    session_type = case_when(
      is.na(session_type) ~ track,
      .default = session_type
    )
  ) |>
  drop_na(talk_title.y) |>
  select(-talk_title.x) |>
  rename(talk_title = talk_title.y)

combined_data <- combined_data |>
  distinct(talk_title) |>
  mutate(page_value = paste0("page", row_number())) |>
  right_join(combined_data, by = "talk_title")



usethis::use_data(combined_data, internal = TRUE)
# usethis::use_data(combined_data, overwrite = TRUE)
