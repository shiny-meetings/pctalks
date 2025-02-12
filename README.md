
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `{pctalks}`

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

## Project Description

An app to explore and watch PositConf 2024 talks.

### Required Features

- Card for individual talk that opens up the talk page containing:
  - talk title  
  - YouTube video  
  - description  
- Ability to filter talks based on:
  - session type  
  - session topics  
  - speaker name, talk title & description

## Existing Work

PositConf 2024 talks platform used green colors and cards as shown in
[this video](https://youtube.com/shorts/rAfBnkZOCxI?feature=share).

## Deliverables

**Start date: 2025-02-05**  
**End date: 2025-02-19**

- Day 1 and 2:
  - [ ] Initial wireframing. You may use AI tools such as
    [tldraw](https://www.tldraw.com/), [shiny
    assistant](https://gallery.shinyapps.io/assistant/#) or [ploomber AI
    editor](https://editor.ploomber.io/)
  - Framework to use:
    - [ ] shiny only
    - [x] [golem](https://github.com/ThinkR-open/golem)
    - [ ] [rhino](https://github.com/Appsilon/rhino)
    - [ ] shiny + [ambiorix](https://ambiorix.dev/)
- Day 3:
  - \[x \] First meeting for discussing UI and features ([meeting
    recording](https://youtu.be/EeYsaBg3gO0?si=L0fRWqrpi4Hf-nI3))
- Day 10:
  - [ ] Second meeting for discussing deployment
- Day 15 or before:
  - [ ] Deployment

## Meetings

Projects start on Wednesdays with meetings on Fridays. We have a shiny
club channel on the [DSLC
Slack](https://dslcio.slack.com/archives/C08A52V98TY) for chatting. Zoom
link appears 10 minutes before meeting on Fridays in the slack channel.

## How to Contribute

- Fork this repository
- Create a new branch for your feature
- Make your changes
- Submit a pull request
- Wait for review and address any feedback

## Installation

You can install the development version of `{pctalks}` like so:

``` r
# FILL THIS IN! HOW CAN PEOPLE INSTALL YOUR DEV PACKAGE?
```

## Run

You can launch the application by running:

``` r
pctalks::run_app()
```

## About

You are reading the doc about version : 0.0.0.9000

This README has been compiled on the

``` r
Sys.time()
#> [1] "2025-02-12 01:22:47 EST"
```

Here are the tests results and package coverage:

``` r
devtools::check(quiet = TRUE)
#> ℹ Loading pctalks
#> ── R CMD check results ───────────────────────────────── pctalks 0.0.0.9000 ────
#> Duration: 1m 8.7s
#> 
#> 0 errors ✔ | 0 warnings ✔ | 0 notes ✔
```

``` r
covr::package_coverage()
#> pctalks Coverage: 41.03%
#> R/global.R: 0.00%
#> R/run_app.R: 0.00%
#> R/app_server.R: 66.67%
#> R/app_config.R: 100.00%
#> R/app_ui.R: 100.00%
```
