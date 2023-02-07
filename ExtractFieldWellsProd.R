#----------------------------------------------------------
# function to extract field wells production data
#
ExtractFieldWellsProd <- function(data, ftba)
{
     data %>% dplyr::filter(field %in% ftba)
}
