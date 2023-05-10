#----------------------------------------------------------
# function to remove well with NA in model  
# 
RemoveWellWithNaInModel <- function(well_data_list) {
  well_data_list <- well_data_list[!is.na(well_data_list$nls_fit), ]     
}
