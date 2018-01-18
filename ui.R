## User interface R file.
shinyUI(fluidPage(
  ## Application title
  titlePanel("UFO Sightings in Maryland - Leaflet & DataTables"),

  ## Row for plot
  fluidRow(
    # Take up 6/12 column space
    column(
      6,
      # Output the ggmap map plot
      leafletOutput("ufoPlot")
      # plotoutput("ufoPlot")
    ),
    column(
      6,
      dataTableOutput("ufoList")
      # tableOutput("ufoList")
    )
  )
))
