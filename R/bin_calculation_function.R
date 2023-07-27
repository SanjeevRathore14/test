
#' function to get the vector, calculate the bins(for histogram) and then return the calculate bins
#'
#' @param var_range
#' @export

bin_count_for_hist <- function(var_range = NULL){
  
  if(is.null(var_range)){
    bins <- as.integer(0)
    }
  else{
    #Sturge’s rule to calculate the number bins from the length of the data
    bins <- as.integer(ceiling(log2(length(var_range))) + 1)
  }
  
  #return the number of bin which calculated from Sturge’s rule
  return(bins)
}