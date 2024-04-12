#' georeferencia UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_georeferencia_ui <- function(id){
  ns <- NS(id)
  tagList(
    leaflet::leafletOutput(ns("bbmap"), width="100%",height="880")
  )
  #tagList(

    #bslib::nav_panel("Mapa",
                    # leaflet::leafletOutput("bbmap", width="100%",height="880")
     #                )

  #)
}

#' georeferencia Server Functions
#'
#' @noRd
#'
#'
mod_georeferencia_server <- function(id, dados){
#' Title
#'
#' @param input
#' @param output
#' @param session
#'
#' @return
#' @export
#'
#'
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    # create the leaflet map
    output$bbmap <- leaflet::renderLeaflet({
      #esp <- sf::st_transform(esp, crs = sf::st_crs("+proj=longlat +datum=WGS84"))
      esp <- sf::st_transform(sf::st_as_sf(esp),4326)
      opt <- leaflet::leafletOptions(zoomControl = TRUE, )
      myLeaflet <- leaflet::leaflet(dados, options = opt)

      myLeaflet %>%
      # browser()
      #leaflet::leaflet(dados) |> #magrittr::%>%
        leaflet::addMarkers(lng = ~Longitude, lat = ~Latitude, popup = ~as.character(dados$InfoLocal)) |>
        leaflet::addTiles() |>
        #leaflet::addControl(html, position = "topright", className = "info legend")|>
        # htmlwidgets::onRender(
        #   "function(el, x) {
        #   map.zoomControl.remove();
        #   L.control.zoom({position:'topright;'}).addTo(this);
        #   L.control.zoom({zoomInText: 'AAAAAA'}).addTo(this);
        # }") %>%
        leaflet::addPolygons(data = esp,
                             fillColor = "blue",
                             weight = 1,
                             opacity = 0,
                             group = "blue") |>
        # leaflet::addEasyButton(
        #   leaflet::easyButton( position = "bottomleft",
        #     icon = htmltools::span(class = "star", htmltools::HTML("&starf;"))
        #     )
        # )|>
        leaflet::addEasyButton(
          leaflet::easyButton(position = "topleft",
          icon="fa-crosshairs", title="Minha localização atual",
          onClick=leaflet::JS("function(btn, map){ map.locate({setView: true}); }")) #,
          #leaflet::easyButton(position = "bottomright")
          )
    })


  })
}

## To be copied in the UI
# mod_georeferencia_ui("georeferencia_1")

## To be copied in the server
# mod_georeferencia_server("georeferencia_1")
