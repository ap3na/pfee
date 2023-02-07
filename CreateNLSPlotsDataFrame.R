#----------------------------------------------------------
# create NLS plots data frame 
# 
CreateNLSPlotsDataFrame <- function(data) {
  data %>% 
    select(well_name, data) %>%
    unnest(data)     
}
