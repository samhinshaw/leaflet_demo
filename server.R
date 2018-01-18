## This is the "server" file of the shiny app.

# googleMap <- get_googlemap(c(mean(ufos$longitude), mean(ufos$latitude)),
#                            zoom = 7, maptype = "roadmap")

## Here's the start of the shiny "machinery".
shinyServer(function(input, output) {

  output$ufoPlot <- renderLeaflet({

    leaflet(ufos) %>%
      addTiles() %>%
      addCircleMarkers(
        lng = ~longitude,
        lat = ~latitude,
        radius = 3,
        color = "black",
        stroke = FALSE, fillOpacity = 0.5,
        label = ~htmlEscape(shape)
      )

  })

  # output$ufoPlot <- renderPlot({
  #
  #   ggmap(googleMap) +
  #     geom_point(data = ufos, aes(longitude, latitude))  +
  #     ggtitle("UFO Sightings in Maryland")
  #
  # })

  # Example
  condition <- FALSE

  output$ufoList <- DT::renderDataTable({
    if (condition) {
      # Return null if nothing so that we don't pass an error
      return(NULL)
    } else {
      # Return the UFO List
      ufos
    }
  },
  # DataTables options
  options = list(
    pageLength = 10,
    lengthMenu = c(5, 10, 15, 20),
    # autoWidth = TRUE,
    scrollX = "100%",
    # AMAZING! Crucial argument to make sure DT doesn't overflow
    # vertical scrolling options
    scrollY = "500px",
    scrollCollapse = TRUE,
    paging = FALSE,
    dom = 'tifr'
  ),
  # Even more options!
  rownames = FALSE,
  selection = list(
    mode = "single", target = "column",
    selected = 0
  ),
  style = "bootstrap",
  class = "table-bordered table-responsive"
  )
})
