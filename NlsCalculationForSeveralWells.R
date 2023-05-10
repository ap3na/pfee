#----------------------------------------------------------
# function to run nls Calculation for several wells
# 
NlsCalculationForSeveralWells <- function(data) {
  data %>% 
    mutate(nls_fit = map(data, ~possibly(~NlsCalculation(.x), 
                                         otherwise = NA,
                                         quiet = TRUE)(.x)))     
}
