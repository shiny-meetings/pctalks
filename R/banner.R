#' @import shiny
app_banner <- div(
  class = "px-5 py-3",
  style = "background-image: url('www/banner.png'); background-size: cover; background-position: center;",
  div(
    class = "display-5 text-white",
    "Explore and Watch Posit Conf 2024 Talks",
    p(class = "lead text-white-50", "Search by Speaker and/or Session Topics")
  )
)
