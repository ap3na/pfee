#----------------------------------------------------------
# t Qcalculation function  
# 
tQcalculationByWells <- function(dat) {
  dat %>%
    group_by(well_name) %>%
    mutate(t = 1:n(),
           Q = cumsum(q * ymmd))
}

