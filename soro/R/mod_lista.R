#' lista UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_lista_ui <- function(id){
  ns <- NS(id)
   tagList(
 DT::dataTableOutput(ns("data"))
   )
}

#' lista Server Functions
#'
#' @noRd
mod_lista_server <- function(id, dados){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    #create a data object to display data

    output$data <-DT::renderDataTable(DT::datatable(
      dados[,c(-8,-9,-10)],
      #filter = 'top',
      colnames = c("Ordem", "Unidade", "GVE", "Municipio", "Endereço", "Disponibilidade"," Telefone","Acidente"),
      options = list(
        language = list(
          info = 'Mostrando de _START_ a _END_ de _TOTAL_.',
          lengthMenu = "Exibir _MENU_ resultados por página",
          search = "Pesquisar",
          emptyTable = "Nenhum registro encontrado",
          zeroRecords = "Nenhum registro encontrado",
          infoEmpty = "Mostrando 0 até 0 de _TOTAL_ registros",
          infoFiltered = "(Filtrados de _MAX_ registros)",
          paginate = list(previous = 'Anterior', `next` = 'Próximo',
                          first =  "Primeiro",
                          last = "Último")
        ),
        pageLength = 10
      )
    )
    )
#browser()
 })
}

## To be copied in the UI
# mod_lista_ui("lista_1")

## To be copied in the server
# mod_lista_server("lista_1")
