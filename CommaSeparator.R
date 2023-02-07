#
# comma separator funection
# x: input vector
#
CommaSeparator <- function(x) {
     return(format(x, big.mark = ",", scientific = FALSE))
}
