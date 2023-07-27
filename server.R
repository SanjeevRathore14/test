#######server part of application#############

app_server <- function(input, output, session) {
  
  #defining the reactive values object
  rv_server <- reactiveValues()
  
  ################Application tab - Data Preview section#########################
  #calling the server function of getdataset module 
  #and storing the return value into "re_server"
  rv_server$getdata_return <- getdatasetServer("getdataset")
  
  #observe event to capture the changes in the return value of getdataset module
  observeEvent(rv_server$getdata_return()$dataset,{
    #rendering datatable to show the preview of selected dataset
    output$data_preview <- DT::renderDataTable({
      datatable(rv_server$getdata_return()$dataset,
                rownames = FALSE,
                class = 'row-border',
                style = "bootstrap4",
                selection=list(target='cell',
                               mode = 'single'),
                options = list(dom = "tp",
                               initComplete = JS("function(settings, json) {",
                                                 "$(this.api().table().header()).css({'background-color': '#82a8f4'});","}"),
                               columnDefs = list(
                                 list(className = 'dt-center',
                                      targets = 0:(ncol(rv_server$getdata_return()$dataset) - 1)))))
    })
  })
  
  ################Application tab - Chart section#########################
  #calling the server function of getdata for chart module
  getdataforchartServer("chart",df = reactive({rv_server$getdata_return()$dataset}))
  
  ################Get Repository tab#########################
  #observe event to validate the email id and show the git repository link
  observeEvent(input$email_submit_btn, {
    
    #assigning the value of emailid input to the reactive list
    rv_server$emailid <- input$emailid
    #validating the input email and assigning the logical flag to the reactive list
    rv_server$emailid_valid_flag <- grepl("@sanofi.com",
                                          as.character(rv_server$emailid),ignore.case = T)
    
    #condition to check the valid email id
    if(!rv_server$emailid_valid_flag) {
      #showing warning message for invalid email id
      output$repo_link <- renderUI(
        div(class="alert alert-danger", role="alert", 
        "Given email id(",tags$b(paste0(rv_server$emailid)),") is invalid.
        Please provide a valid email address.", br(),
        tags$b("Note: Only sanofi's email id is accepted.")))
    }
    else {
      #showing the git repository link of the project
      output$repo_link <- renderUI(
        div(class="alert alert-success", role="alert",
            tags$b("Git Repository Link:"),br(),
            tags$a("https://gitlab.sanofiart.com/art/r/poc/full-stack-r-shiny-testing")))
    }
  })
  
}
