# function to run producing forecasting by wells (PfWells)

PfWells <- function(field, dat) {
    # 1.Extract Field Data function
    dat <- ExtractFieldWellsProd(dat, field)
    # 2.Q Calculation function
    dat <- tQcalculationByWells(dat)
    # 3.nls Calculation function
    well_data_list <- WellDataList(dat)
    # 4.nls calculation for several wells
    well_data_list <- NlsCalculationForSeveralWells(well_data_list)
    # 5.remove well with NA in the model     
    well_data_list <- RemoveWellWithNaInModel(well_data_list)
    # 6.create nls plots data frame      
    nls_plots <- CreateNLSPlotsDataFrame(well_data_list)
    # 7.nls well pred time
    nls_well_pred_time <- NlsWellPredTime(well_data_list, nls_plots)
    # 8.nls well pred value
    nls_well_pred_value <- NlsWellPredValue(nls_well_pred_time, well_data_list)
    # 9.qf & Qf calculation
    nls_well_pred_value <- qfQfCalculation(dat, nls_well_pred_value)
    # 10.date complete values
    nls_well_pred_value <- DateCompleteValues(nls_well_pred_value)
    # 11.adds analysed field to df
    nls_well_pred_value["field"] <- field    
    # 12.output objects 
    out <- list(data = nls_well_pred_value,
                nls_obj = well_data_list)
    return(out)
}
