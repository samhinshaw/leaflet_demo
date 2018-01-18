## User interface R file.
shinyUI(fluidPage(
  ## Application title
  titlePanel("UFO Sightings in Maryland - ggmap"),

  ## Row for plot
  fluidRow(
    # Take up 6/12 column space
    column(
      6,
      # Output the ggmap map plot
      leafletOutput("ufoPlot")
    ),
    column(
      6,
      dataTableOutput("ufoList")
    )
  )
))
