library(shinytest2)

test_that("{shinytest2} recording: full-stack-r-shiny-testing", {
  
  #when app loads, it sets screen height and Width automatically 
  app <- AppDriver$new(variant = platform_variant(), name = "full-stack-r-shiny-testing", 
      height = 617, width = 1065)
  
  #Sets input id `getdataset-dataset` to "pressure"
  app$set_inputs(`getdataset-dataset` = "pressure")
  
  #Captures shiny input and output values
  app$expect_values()
  
  #Sets input id `chart-chart_tpe` to "Box-Plot"
  app$set_inputs(`chart-chart_tpe` = "Box-Plot")
  
  #Captures screenshot, shiny input and output values
  app$expect_values()
  app$expect_screenshot()
  
  #Sets input id `getdataset-dataset` to "quakes"
  app$set_inputs(`getdataset-dataset` = "quakes")
  
  #Captures shiny input and output values
  app$expect_values()
  
  # #Sets input id `chart-chart_tpe` to "Histogram"
  # app$set_inputs(`chart-chart_tpe` = "Histogram")
  # 
  # #Captures Screenshot
  # app$expect_screenshot()
})
