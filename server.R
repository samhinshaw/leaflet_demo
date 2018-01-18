## This is the "server" file of the shiny app.

googleMap <- get_googlemap(c(mean(ufos$longitude), mean(ufos$latitude)),
                           zoom = 7, maptype = "roadmap")

## Here's the start of the shiny "machinery".
shinyServer(function(input, output) {
  output$ufoPlot <- renderPlot({

    ggmap(googleMap) +
      geom_point(data = ufos, aes(longitude, latitude))  +
      ggtitle("UFO Sightings in Maryland")

  })

  # Example
  condition <- FALSE

  output$ufoList <- renderTable({
    if (condition) {
      # Return null if nothing so that we don't pass an error
      return(NULL)
    } else {
      # Return the UFO List
      ufos
    }
  })
})
