#----------------------------------------------------------
# WellDataList function
#
WellDataList <- function(data) {
  data %>%
    select(well_name, t, Q) %>%
    group_by(well_name) %>%
    group_nest()
}
