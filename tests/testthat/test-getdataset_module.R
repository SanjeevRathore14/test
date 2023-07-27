#Below is the test for the server function of "getdataset_module.R" module 
#which is used to select and load the dataset for "Data Preview" section

test_that("Test for getdataset module",{
  
  #testing the module server
  testServer(getdatasetServer,{
    
    #Setting the value of dataset input to "mtcars"
    session$setInputs(dataset = "mtcars")
    
    #Storing the return value of module into the object
    rv_getdataset_return <- session$getReturned()
    
    #Test to check the class of return object
    expect_type(rv_getdataset_return(),"list")
    
    #Test to check the class of return dataset
    expect_s3_class(rv_getdataset_return()$dataset,"data.frame")
    
    #Test to check that the return dataframe is same as per the set value of dataset input
    expect_equal(rv_getdataset_return()$dataset, mtcars)
    
    #Test to check the class of return dataset name
    expect_type(rv_getdataset_return()$name,"character")
     
    #Test to check that the name of the return dataset is same as per the selected "dataset" input
    expect_equal(rv_getdataset_return()$name, "mtcars")
    
  })
})
