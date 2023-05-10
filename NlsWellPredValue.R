#----------------------------------------------------------
# NLS predict values calculations
#
NlsWellPredValue <- function(nls_well_pred_time, well_data_list) {
  nls_well_pred_time %>%
    group_by(well_name) %>%
    nest(preds = t) %>%
    left_join(select(well_data_list, well_name, nls_fit),
              by = "well_name") %>%
    mutate(preds = map2(preds, nls_fit,
                        ~broom::augment(.y, newdata = .x))) %>%
    select(-nls_fit) %>%
    ungroup() %>%
    unnest(cols = preds)
}
