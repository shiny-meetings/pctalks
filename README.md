
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
  - [x] First meeting for discussing UI and features ([meeting
    recording](https://youtu.be/EeYsaBg3gO0?si=L0fRWqrpi4Hf-nI3))
- Day 10:
  - [x] Second meeting for discussing deployment ([meeting
    recording](https://www.youtube.com/watch?v=O7hYqjLYwa8))
- Day 15 or before:
  - [x] Deployment: <https://umair.shinyapps.io/pctalks/>

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
remotes::install_github("shiny-meetings/pctalks")
#> Using GitHub PAT from the git credential store.
#> Downloading GitHub repo shiny-meetings/pctalks@HEAD
#> Warning in untar2(tarfile, files, list, exdir, restore_times): skipping pax
#> global extended headers
#> Warning in untar2(tarfile, files, list, exdir, restore_times): skipping pax
#> global extended headers
#> cli      (3.6.3    -> 3.6.4 ) [CRAN]
#> R6       (2.5.1    -> 2.6.1 ) [CRAN]
#> Rcpp     (1.0.13-1 -> 1.0.14) [CRAN]
#> later    (1.3.2    -> 1.4.1 ) [CRAN]
#> promises (1.3.0    -> 1.3.2 ) [CRAN]
#> purrr    (1.0.2    -> 1.0.4 ) [CRAN]
#> shiny    (1.9.1    -> 1.10.0) [CRAN]
#> Installing 7 packages: cli, R6, Rcpp, later, promises, purrr, shiny
#> Installing packages into 'C:/Users/umair/AppData/Local/Temp/RtmpMLdZnr/temp_libpath6fc057682b'
#> (as 'lib' is unspecified)
#> package 'cli' successfully unpacked and MD5 sums checked
#> package 'R6' successfully unpacked and MD5 sums checked
#> package 'Rcpp' successfully unpacked and MD5 sums checked
#> package 'later' successfully unpacked and MD5 sums checked
#> package 'promises' successfully unpacked and MD5 sums checked
#> package 'purrr' successfully unpacked and MD5 sums checked
#> package 'shiny' successfully unpacked and MD5 sums checked
#> 
#> The downloaded binary packages are in
#>  C:\Users\umair\AppData\Local\Temp\Rtmp8qzBGb\downloaded_packages
#> ── R CMD build ─────────────────────────────────────────────────────────────────
#>          checking for file 'C:\Users\umair\AppData\Local\Temp\Rtmp8qzBGb\remotes190868814cc1\shiny-meetings-pctalks-e8f78e8/DESCRIPTION' ...  ✔  checking for file 'C:\Users\umair\AppData\Local\Temp\Rtmp8qzBGb\remotes190868814cc1\shiny-meetings-pctalks-e8f78e8/DESCRIPTION'
#>       ─  preparing 'pctalks':
#>    checking DESCRIPTION meta-information ...     checking DESCRIPTION meta-information ...   ✔  checking DESCRIPTION meta-information
#>       ─  excluding invalid files (369ms)
#>    Subdirectory 'R' contains invalid file names:
#>      '_disable_autoload.R'
#>       ─  checking for LF line-endings in source and make files and shell scripts
#>       ─  checking for empty or unneeded directories
#>       ─  looking to see if a 'data/datalist' file should be added
#>       ─  building 'pctalks_0.0.0.9000.tar.gz'
#>      
#> 
#> Installing package into 'C:/Users/umair/AppData/Local/Temp/RtmpMLdZnr/temp_libpath6fc057682b'
#> (as 'lib' is unspecified)
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
#> [1] "2025-02-16 19:46:40 EST"
```

Here are the tests results and package coverage:

``` r
devtools::check(quiet = TRUE)
#> ℹ Loading pctalks
#> ── R CMD check results ───────────────────────────────── pctalks 0.0.0.9000 ────
#> Duration: 1m 28.7s
#> 
#> ❯ checking installed package size ... NOTE
#>     installed size is  7.4Mb
#>     sub-directories of 1Mb or more:
#>       R   6.4Mb
#> 
#> 0 errors ✔ | 0 warnings ✔ | 1 note ✖
```

``` r
covr::package_coverage()
#> pctalks Coverage: 49.43%
#> R/create_talks.R: 0.00%
#> R/run_app.R: 0.00%
#> R/app_server.R: 77.42%
#> R/app_config.R: 100.00%
#> R/app_ui.R: 100.00%
```
