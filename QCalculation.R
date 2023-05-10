#----------------------------------------------------------
# function to run logistic growth model 
# 
QCalculation <- function(t, K, n, a) {
  (K * t ^ n) / (a + t ^ n)
}
