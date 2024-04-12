#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    ###https://www.youtube.com/watch?app=desktop&v=WisrcQ89igY
###https://rstudio.github.io/bslib/articles/sidebars/index.html#multi-page-example
#https://talks.cpsievert.me/20200715/#3
    bslib::page_navbar(
      title = "Pontos de Atendimento",
      #bslib::nav_panel("Mapa", leaflet::leafletOutput("bbmap", width="100%",height="880")),
      bslib::nav_panel("Mapa",mod_georeferencia_ui("georeferencia_1") ),
       bslib::nav_panel("Lista Endereço",mod_lista_ui("lista_1") )
    ),
##coloca o brasao do governo
##tags$head(tags$link(rel = "shortcut icon", href = "favicon.png")),
## modifica o css para atual com o layout SeCom
##tags$link(rel = "stylesheet", type = "text/css", href = "styles.css?v=240226")
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(
      ext = "png"
    ),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "soro"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
