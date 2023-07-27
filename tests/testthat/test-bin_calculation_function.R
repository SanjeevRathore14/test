# Test for bin calculation function
test_that("Test for bin calculation", {
  
  #Test to check the return value of the function if range is null
  expect_equal(bin_count_for_hist(NULL),as.integer(0))
  
  #Test to check the return value of the function if range is "mtcars[[1]]"
  expect_equal(bin_count_for_hist(mtcars[[1]]),as.integer(ceiling(log2(length(mtcars[[1]]))) + 1))
  
  #Test to check the return type the function
  expect_type(bin_count_for_hist(mtcars[[1]]),"integer")
  
})
