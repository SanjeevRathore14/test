#' module to get the dataset
#'
#' @param input output session shiny attribute
#' @export

#UI function
getdatasetUI <- function(id, filter = "is.data.frame") {
  #loading the names of all the datasets from "datasets" package
  names <- ls("package:datasets")
  if (!is.null(filter)) {
    #loading the actual datasets and their names
    data <- lapply(names, get, "package:datasets")
    names <- names[vapply(data, filter, logical(1))]
  }
  tagList(
    #row for dataset input
    fluidRow(
      #heading
      h3("Data Preview"),
      column(width = 6,
             #dorpdown list to show the list of datset names
             pickerInput(inputId = NS(id, "dataset"),
                         label = "Select Dataset",
                         choices = names))) #end of dataset input row
    )
}

#Server function
getdatasetServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    #defining the reactive values object
    rv_getdataset <- reactiveValues()
    
    #observe event to capture the change in the dataset input
    observeEvent(input$dataset,ignoreNULL = TRUE,{
      #loading the selected dataset from datasets package and storing it into rv_getdataset
      rv_getdataset$dataset <- as.data.frame(get(input$dataset, "package:datasets"))
      #storing the name of the slected dataset into rv_getdataset
      rv_getdataset$name <- as.character(input$dataset)
    })
    #returning the name and actual dataset
    return(reactive(rv_getdataset))
  })
}



