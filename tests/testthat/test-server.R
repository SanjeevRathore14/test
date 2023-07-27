#Below is the test for the server function of application

test_that("Test for application server",{
  
  #testing the module server
  testServer(expr = {
    
    #Setting the value of emailid input to "temp@abc.com"
    session$setInputs(emailid = "temp@abc.com")
    #clicked on email_submit_btn button
    session$setInputs(email_submit_btn = 1)
    #Test to check the value of emailid_valid_flag based on "temp@abc.com" input.
    #In this case, it should be false.
    expect_false(rv_server$emailid_valid_flag)
    
    #Setting the value of emailid input to "temp@sanofi.com"
    session$setInputs(emailid = "temp@sanofi.com")
    #clicked on email_submit_btn
    session$setInputs(email_submit_btn = 2)
    #Test to check the value of emailid_valid_flag based on "temp@sanofi.com" input. 
    #In this case, it should be true.
    expect_true(rv_server$emailid_valid_flag)
    
    #Test to check the type of emailid_valid_flag. it should always return the logical value.
    expect_type(rv_server$emailid_valid_flag,"logical")
    
    
  })
})
