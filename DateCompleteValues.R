#----------------------------------------------------------
# function to complete date values
# 
DateCompleteValues <- function(data) {
  # remove wrong date 
  d2 <- data %>% 
    group_by(well_name) %>% 
    mutate(date = NaDate(date, q)) 
  
  # filter out q equal NA
  d3 <- d2 %>% 
    group_by(well_name) %>% 
    filter(is.na(q)) %>% 
    ungroup() %>%
    select(well_name, tn = t)    
  
  # extract last date production 
  d4 <- d2 %>% 
    group_by(well_name) %>% 
    mutate(da_max = ExtractLastProdDate(date)) %>%
    ungroup() %>% 
    select(well_name, da_max, t, q)     
  
  # add number of months to date 
  d5 <- d4 %>% 
    group_by(well_name) %>%
    filter(is.na(q)) %>%
    mutate(tp = 1:n()) %>% 
    mutate(date1 = da_max %m+% months(tp)) %>%
    ungroup() %>%
    select(well_name, t, date1)
  
  # join d2 & d5
  d6 <- 
    full_join(d2, d5, by = c("well_name", "t")) %>%
    distinct(t, .keep_all = T) %>%
    arrange(well_name, t)
  
  # corrected date  
  data <- d6 %>% 
    mutate(date2 = if_else(is.na(date), date1, date)) %>%
    select(-date, -date1) %>%
    rename(date = date2)
}
