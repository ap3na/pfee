#----------------------------------------------------------
# function to put NA value to date if q value is NA
# 
NaDate <- function(date, q) {
  x = if_else(is.na(q), ymd(NA), ymd(date))  
}
