# Global R file. This file is executed before server.R or ui.R, so whatever is
# done here is available to both your ui and server code.

suppressMessages({
  library(shiny)
  library(ggplot2)
  library(ggmap)
  library(scales)
  library(lubridate)
  library(ggmap)
  library(dplyr)
  library(magrittr)
  library(here)
  library(DT)
  library(readr)
  library(leaflet) # install.packages('leaflet')
})

ufos <- read_csv("md_ufos.csv")

ufos %<>%
  filter(latitude <= 40)

