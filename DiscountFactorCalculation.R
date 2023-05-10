# Discount factor calculation function 

# step 1: calculate conversion factor (cf)

# cf: conversion factor (result)
# input parameters:
# i = discount rate (% decimal), example: 0.12
# n: number of compounding periods of a discount factor per year, 
#  n = 1 for yearly     
#  n = 12 for monthly 
#  n = 365 for daily  

# step 2: calculate discount factor (df)

#  t: time vector starting in zero

# example:
# i = 0.12; n = 12; t = c(0:5)
# results: 1.000 0.990 0.980 0.971 0.961 0.951

DiscountFactorCalculation <- function(i, n, t) {
    conversion_factor = ((1+i)^(1/n)-1)
    discount_factor <- (1/(1+conversion_factor)) ^ (t)
    return(discount_factor)
}
