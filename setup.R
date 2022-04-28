## file structure
if (!file.exists("data_raw")) dir.create("data_raw")

if (!file.exists("data_raw/surveys.csv")) {
    download.file("https://zenodo.org/record/6501593/files/surveys.csv?download=1",
                  "data_raw/surveys.csv")
}
if (!file.exists("data_raw/species.csv")) {
    download.file("https://zenodo.org/record/6501593/files/ceramic_types.csv?download=1",
                  "data_raw/ceramic_types.csv")
}
if (!file.exists("data_raw/plots.csv")) {
    download.file("https://zenodo.org/record/6501593/files/plots.csv?download=1",
                  "data_raw/plots.csv")
}
if (!file.exists("data_raw/ceramics_data.csv")) {
    download.file("https://zenodo.org/record/6478181/files/ceramics_data.csv?download=1",
                  "data_raw/ceramics_data.csv")
}

if (!file.exists("data_raw/ceramics_data.sqlite")) {
    download.file("https://zenodo.org/record/6501494/files/ceramics_data.sqlite?download=1",
                  "data_raw/ceramics_data.sqlite")
}


## knitr options
library(knitr)
library(methods)
suppressPackageStartupMessages(library(tidyverse))
knitr::opts_chunk$set(results='hide', fig.path='img/R-archaeology-',
                      comment = "#>", purl = FALSE)

### Custom hooks

## hook for challenges answers

knitr::knit_hooks$set(answer = function(before, options, envir) {
  if (before) {
    paste(
      "<div class=\"accordion\">",
      "<h3 class=\"toc-ignore\">Answer</h3>",
      "<div style=\"background: #fff;\">",  sep = "\n")
  } else {
    paste("</div>", "</div>", sep = "\n")
  }
})

eng_text_answer <- knitr:::eng_html_asset(
                               paste(
                                   "<div class=\"accordion\">",
                                   "<h3 class=\"toc-ignore\">Answer</h3>",
                                   "<div style=\"background: #fff;\">",
                                   "<p>",  sep = "\n"),
                               paste(
                                   "</div>", "</div>", "</p>", sep = "\n"
                               )
                           )

knitr::knit_engines$set(text_answer = eng_text_answer)
