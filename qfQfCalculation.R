#----------------------------------------------------------
# qf & Qf calculations
#
qfQfCalculation <- function(well_data, nls_well_pred_value) {
  well_data %>%
    full_join(nls_well_pred_value,
              by = c("well_name", "t")) %>%
    arrange(well_name, t) %>%
    mutate(qf = lead(.fitted, n = 1L, default = 0) - .fitted,
           qf = qf * ymmd / 1000) %>%
    dplyr::rename(Qf = .fitted) %>%
    filter(qf >= 0) # remove values less than zero
}
