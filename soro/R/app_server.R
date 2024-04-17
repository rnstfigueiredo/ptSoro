#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @export
#'

#'
#'
#'
##pkgload::load_all(path = "data/")
# library(shiny)
#library(shiny.i18n)
# library(dplyr)
# library(leaflet)
# library(DT)
# library(sf)
# library(DBI)
# library(RMariaDB)




app_server <- function(input, output, session) {
  # Your application server logic



  localhost = get_golem_config("hostlocal", config = "severkey")
  localhost = get_golem_config("hostlocal", config = "severkey")
  localhost = get_golem_config("hostlocal", config = "severkey")


  MyQuerySoro = paste('SELECT UNIDADE, GVE, MUNICIPIO, ADDRESS, DISPONIBILIDADE, MOBILE, ACIDENTE, Latitude, Longitude,
CONCAT("<strong>Local: </strong>",UNIDADE, "<br><strong>Município:</strong> ", MUNICIPIO,
                                     "<br><strong>End.:</strong> ",ADDRESS,
                                     "<br><strong>Fone:</strong> ",MOBILE,
                                     "<br><font color="#800080"><strong>Acidente:</strong></font> ",ACIDENTE,
                                     "<br><strong>Soro(s):</strong> ",DISPONIBILIDADE) AS InfoLocal FROM BaseSoroZoo WHERE Excluido LIKE "N";')


  bb_data <- DBI::dbGetQuery(conDb,MyQuerySoro)

  DBI::dbDisconnect(conDb)


  #mod_georeferencia_server("georeferencia_1", bb_data)
  # browser()


  mod_lista_server("lista_1", dados = bb_data)
  mod_georeferencia_server("georeferencia_1", dados = bb_data)
  # output$data <-DT::renderDataTable(DT::datatable(
  #   bb_data[,c(-8,-9,-10)],
  #   options = list(
  #     language = list(
  #       info = 'Mostrando de _START_ a _END_ de _TOTAL_ locais.',
  #       search = "Pesquisar",
  #       paginate = list(previous = 'Anterior', `next` = 'Próximo',
  #                       first =  "Primeiro",
  #                       last = "Último")
  #     ),
  #     pageLength = 10
  #   ),
  #   filter = 'top',
  #   colnames = c("Ordem", "Unidade", "GVE", "Municipio", "Endereço", "Disponibilidade"," Telefone","Acidente")
  # ))

}

