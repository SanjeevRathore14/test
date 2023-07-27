#Below is the test for the server function of "test-getdataforchart_module.R" module 
#which is used to select the variable & chart type and generate the chart based on inputs

test_that("Test for getdataforchart module",{
  
  #value for the module parameter
  input_dataset <- reactiveVal(mtcars)
  
  #testing the module server
  testServer(getdataforchartServer,args = list(df = input_dataset), {

    #Setting the value of variable input to "mpg"
    session$setInputs(var = "mpg")

    #Setting the value of chart type input to "Histogram"
    session$setInputs(chart_tpe = "Histogram")

    #Test to check the value of rv_chart$var
    expect_equal(rv_chart$var, "mpg")

    #Test to check the value of rv_chart$chart_tpe
    expect_equal(rv_chart$chart_tpe, "Histogram")

    #Test to check the value of rv_chart$data_for_chart based on input
    expect_equal(rv_chart$data_for_chart, df()[complete.cases(df()),])

    #Test to check the type of rv_chart$data_for_chart
    expect_s3_class(rv_chart$data_for_chart,"data.frame")
    
  })
})

