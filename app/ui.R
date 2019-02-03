library(shiny)
library(leaflet)


prim_source = c("hydroelectric"
                ,"natural gas"
                ,"coal"
                ,"nuclear"
                ,"petroleum"
                ,"pumped storage"
                ,"geothermal"
                ,"biomass"
                ,"wind"
                ,"other"
                ,"batteries"
                ,"solar")

shinyUI(fluidPage(
  tags$head(tags$title("Electric Power Plants")),
  sidebarPanel(
    h4("Instructions:"),
    p("The map on the right shows the locations of the electric power plants in the United States segmented by the main energy source."),
    p("From the list below select the main energy source to see the corresponding power plants."),
    p("Data from the U.S. Energy Information Administration (https://www.eia.gov/maps/layer_info-m.php)"),
    selectInput(
      "prim_source",
      "Select main energy source:",
      prim_source,
      selected = "natural gas",
      multiple = F
    )),
  mainPanel(leafletOutput("ppmap"),
            h2(textOutput("map_title"))
            )
  
)
)
