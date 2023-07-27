# boiler plate

if(dir.exists("R")) shiny::addResourcePath(prefix = "R", directoryPath = "R")
if(dir.exists("data")) shiny::addResourcePath(prefix = "data", directoryPath = "data")
if(dir.exists("resources")) shiny::addResourcePath(prefix = "resources", directoryPath = "resources")

# wrappers

sanofiNavbarPage <- function(title, ..., id = NULL, altTitle = title, navTitle = NULL, windowTitle = title,
                             header = NULL, footer = NULL, theme = NULL, position = 'fixed-top'){
  # theme
  themeLogo <- NULL
  if(isTRUE(theme == 'art')){
    themeLogo <- tagList(tags$span('Powered by'),
                         tags$img(id = 'sanofi-header-logo-bp', src = 'resources/art_logo.svg'),
                         tags$img(id = 'sanofi-header-logo-art', src = 'resources/sanofi_logo_new.svg'))
  }
  
  # position: only "static-top" and "fixed-top" are supported
  positionCSS <- NULL
  if(position == 'fixed-top'){
    positionCSS <- tags$link(rel = 'stylesheet',
                             type = 'text/css',
                             href = 'resources/shiny_navFixedTop.css')
  }
  
  # styled navigation page
  fluidPage(
    
    # enable MathJax
    withMathJax(),
    
    # css
    tags$link(rel = 'stylesheet',
              type = 'text/css',
              href = 'resources/shiny.css'),
    
    positionCSS,
    tags$script(type = 'text/javascript',
                src = 'resources/shiny_top.js'),
    
    # custom header
    tags$div(id = 'sanofi-header',
             tags$div(id = 'sanofi-header-left',
                      tags$div(id = 'sanofi-header-left-logo',
                               tags$img(src = 'resources/data_designer_hex_logo_new.png')),
                      tags$div(id = 'sanofi-header-title',
                               title),
                      tags$div(id = 'sanofi-header-title-alt',
                               altTitle)),
             tags$div(id = 'sanofi-header-right',
                      tags$div(id = 'sanofi-header-right-logo',
                               themeLogo))
    ),
    
    # shiny
    navbarPage(title = navTitle,
               ...,
               id = id,
               position = position,
               windowTitle = windowTitle,
               header = header,
               footer = footer,
               inverse = TRUE,
               collapsible = TRUE),
    
    # javascript bottom
    tags$script(type = 'text/javascript',
                src = 'resources/shiny_bottom.js')
    
  )
}




