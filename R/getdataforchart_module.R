#' module to set the variable & type of chart inputs and generate the chart based on selected inputs
#'
#' @param input output session df shiny attribute
#' @export

#UI function
getdataforchartUI <- function(id) {
  tagList(
    #row for inputs
    fluidRow(
      #heading
      h3("Chart"),
      column(width = 6,
             #input for variable
             pickerInput(NS(id, "var"),
                         label = "Select Variable",
                         choices = NULL)),
      column(width = 6,
             #input for chart type
             pickerInput(NS(id, "chart_tpe"),
                         label = "Chart Type",
                         choices = c("Histogram","Box-Plot")))), #end of input's row
    #row for chart output
    fluidRow(
      column(width = 12,
             #div for chart output section
             tags$div(class = "output_chart_div",
                      #defining plotoutput output with spinner
                      shinycssloaders::withSpinner(plotOutput(NS(id, "chart")),type = 8)))) #end of chart output's row
  )
}


#server function
getdataforchartServer <- function(id,df) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    
    #defining reactive values object
    rv_chart <- reactiveValues()
    
    #observe event to capture the change in the dataset
    observeEvent(df(),{
      #updating the list of variables
      updatePickerInput(session = session,inputId = "var",
                        label = "Variable",
                        choices = names(df()[,unlist(lapply(df(), is.numeric))]))
    })
    
    #observe event to capture the changes in var and chart_type inputs
    observeEvent(list(input$var,input$chart_tpe),ignoreInit = TRUE,{
      #validation on var input
      req(input$var %in% names(df()))
      
      #assigning value of chart_type input to rv_chart
      rv_chart$chart_tpe <- input$chart_tpe
      
      #assigning value of var input to rv_chart
      rv_chart$var <- input$var
      
      #removing missing values from the dataset and stored into rv_chart
      rv_chart$data_for_chart <- as.data.frame(df()[complete.cases(df()),])
      
      #calling bin count function to get the number of bins based on the variable range
      #and stored into bin_count variable
      bin_count <- bin_count_for_hist(var_range = rv_chart$data_for_chart[[rv_chart$var]])
      
      #rendering chart
      output$chart <- renderPlot({
        #condition to check the type of chart
        if(rv_chart$chart_tpe == "Histogram"){
          #generating histogram chart using ggplot2
          p <- ggplot(rv_chart$data_for_chart,
                      aes(x=rv_chart$data_for_chart[[input$var]])) +
            geom_histogram(color="black",
                           fill="#82a8f4",
                           bins = bin_count) +
            ggtitle(label = paste0(rv_chart$chart_tpe," - ",rv_chart$var)) +
            xlab("Bins") +
            ylab("No. of Observations") +
            theme_light()
        }else if(rv_chart$chart_tpe == "Box-Plot"){
          #generating Box-plot chart using ggplot2
          p <- ggplot(rv_chart$data_for_chart,
                      aes(x = "X1", y = rv_chart$data_for_chart[[input$var]])) + 
            geom_boxplot(outlier.color = "#ffa500",
                         fill = "#82a8f4") +
            stat_summary(fun = "mean",
                         geom = "point",
                         shape = 15,
                         size = 2,
                         color = "white") +
            ggtitle(label = paste0(rv_chart$chart_tpe," - ",rv_chart$var)) + 
            xlab(rv_chart$var) + 
            ylab("Range") + 
            theme_light() + 
            coord_flip()
        }
        p
      },height = 450)
      
    })
  })
}
