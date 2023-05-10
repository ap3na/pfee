#----------------------------------------------------------
# create NLS predict times
#
NlsWellPredTime <- function(well_data_list, nls_plots) {
  tidyr::crossing(
    well_name = well_data_list$well_name,
    t = seq(min(nls_plots$t),
            max(nls_plots$t) + fpt))
}
