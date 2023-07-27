
#loading packages
suppressPackageStartupMessages({
  suppressWarnings({
  library(shiny)
  library(ggplot2)
  library(dplyr)
  library(datasets)
  library(shinyWidgets)
  library(shinycssloaders)
  library(data.table)
  library(stats)
  library(shinyjs)
  library(DT)
  library(blastula)
  library(testthat)
  library(shinytest2)
  library(diffviewer)
  })
})
 
  


# adding directory
if(dir.exists("R")) addResourcePath(prefix = "R", directoryPath = "R")
if(dir.exists("data")) addResourcePath(prefix = "data", directoryPath = "data")
if(dir.exists("resources")) addResourcePath(prefix = "resources", directoryPath = "resources")
if(dir.exists("components")) addResourcePath(prefix = "components", directoryPath = "components")


# common Sanofi Shiny template
if(dir.exists("resources")) source("resources/shiny.R")

# load custom modules and functions
source(file.path("R","getdataset_module.R"))
source(file.path("R","getdataforchart_module.R"))
source(file.path("R","bin_calculation_function.R"))
