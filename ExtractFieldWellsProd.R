#----------------------------------------------------------
# function to extract field wells production data
# columns included in data::"field" "date" "q" "well_name"
# ftba: name of the field to be analized

ExtractFieldWellsProd <- function(data, ftba)
{
     data %>% dplyr::filter(field %in% ftba)
}
