# FpeeByWells function to map
#
# example:
# fields contains fields to be analized
# dat: df that contains field data (field, date & q)
# data <- map_dfr(fields, FpeeByWells)
#
FpeeByWells <- function(field, dat) {
     # ExtractFieldData function: function to select data for field to be analyzed
     dat <- ExtractFieldWellsProd(dat, field)
     # QCalculation function
     dat <- tQcalculationByWells(dat)
     # NlsCalculation function
     well_data_list <- WellDataList(dat)
     # nls calculation for several wells
     well_data_list <- NlsCalculationForSeveralWells(well_data_list)
     # remove well with NA in the model
     well_data_list <- RemoveWellWithNaInModel(well_data_list)
     # create nls plots data frame
     nls_plots <- CreateNLSPlotsDataFrame(well_data_list)
     # nls well pred time
     nls_well_pred_time <- NlsWellPredTime(well_data_list, nls_plots)
     # nls well pred value
     nls_well_pred_value <- NlsWellPredValue(nls_well_pred_time, well_data_list)
     # qf & Qf calculation
     nls_well_pred_value <- qfQfCalculation(dat, nls_well_pred_value)
     # date complete values
     nls_well_pred_value <- DateCompleteValues(nls_well_pred_value)
     # adds analysed field to df
     nls_well_pred_value["field"] <- field
#     return(out <- list(value = list(nls_well_pred_value),
#                        nls = list(well_data_list)))
     return(nls_well_pred_value)
}
