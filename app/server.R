library(shiny)
library(dplyr)
library(leaflet)
library(foreign)
library(glue)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Get data
  # Source: "https://www.eia.gov/maps/map_data/PowerPlants_US_EIA.zip"
  power_plants <- foreign::read.dbf("PowerPlants_US_201810.dbf")
  
  # Source: https://stackoverflow.com/a/16249622
  capFirst <- function(s) {
    paste(toupper(substring(s, 1, 1)), substring(s, 2), sep = "")
  }
  
  
  output$ppmap <- renderLeaflet({
    
    leaflet() %>% 
      addTiles() %>%
      addCircleMarkers(data = power_plants %>% filter(PrimSource==input$prim_source), 
                       #radius = ~ Total_MW,
                       lat = ~Latitude,
                       lng = ~ Longitude, 
                       label  =  ~Plant_Name,
                       stroke = FALSE, 
                       fillOpacity = 0.5,
                       clusterOptions = markerClusterOptions()
      )
    
    
  })
  
  output$map_title = renderText(sprintf("%s power plants in the United States",capFirst(input$prim_source)))
  
})
