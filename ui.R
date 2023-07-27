#######ui part of application#############

#loading the sanofi template
sanofiNavbarPage(
  #title of Page
  title = "Automated Testing Demo",
  #theme of the page
  theme = 'art',
  #defining id for the page header
  id = "tabs_top_header",
  #defining the content of the page footer
  footer = tagList(tags$link(rel = 'stylesheet',
                             type = 'text/css',
                             href = 'R/custom.css')),
  #Application tab
  tabPanel(title = tagList(tags$span('Application')),
           value = "demo_page",
           fluidRow(style = "margin-top:-2rem;", #setting top margin from navbar
                    #Data Preview section
                    column(width = 6,
                           #calling the UI function of getdataset module
                           getdatasetUI("getdataset"),
                           fluidRow(
                             column(width = 12,
                                    #div for Data datatable output
                                    tags$div(class = "output_datatbale_div",
                                             #defining datatable output with spinner
                                             shinycssloaders::withSpinner(DT::dataTableOutput("data_preview",
                                                                                              height = "450px"),
                                                                          type = 8))))),
                    #chart section
                    column(width = 6,
                           #calling the UI function of getdata for chart module
                           getdataforchartUI("chart")))
           ), #end of Application tab
  #get repository link tab
  tabPanel(title = "Get Repository",
           value = "sanofiRightTabPanelHelp", 
           icon = icon('comment-dots'),
           fluidRow(
             column(6,
                    #text area input for email id
                    textAreaInput(inputId = "emailid", 
                                  HTML("<b>Email ID:</b>"),
                                  width = "100%",
                                  rows = 1,
                                  placeholder = "Enter Sanofi email id to get the git repository link of the project")),
             column(6,
                    style = "margin-top: 2.4rem;", #setting margin from top
                    #action button to submit the email id
                    actionButton(inputId = "email_submit_btn",
                                 label = "Submit",
                                 style="color: #fff; background-color: #337ab7; border-color: #2e6da4"))),
           fluidRow(
             column(6,
                    #ui output to show the repo link
                    uiOutput("repo_link")),
             column(6))
           ), #end of get repository link tab
  #Information tab
  tabPanel(title = "Information",
           value = "sanofiRightTabPanelHelp", 
           icon = icon('info'),
           fluidRow(
             tabsetPanel(
               #sub tab for session information
               tabPanel(title = "Session Info",
                        #including r markdown file of session info
                        includeMarkdown("components/sessioninfo/sessioninfo.md")),
               #sub tab for changelog
               tabPanel(title = "Changelog", 
                        #including r markdown file of changelog
                        includeMarkdown("components/changelog/changelog.md")),
               #sub tab for testing
               tabPanel(title = "Testing",
                        #including r markdown file of testing
                        includeMarkdown("components/testoutput/testing.md"))))
           ) #end of information tab
  ) # end of Navbar
