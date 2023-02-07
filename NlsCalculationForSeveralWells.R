#----------------------------------------------------------
# function to run NlsCalculation for several wells
# 
NlsCalculationForSeveralWells <- function(data) {
  data %>% 
    mutate(nls_fit = map(data, ~possibly(~NlsCalculation(.x), 
                                         otherwise = NA,
                                         quiet = TRUE)(.x)))     
}
