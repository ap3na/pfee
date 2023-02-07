# PrintDT function, function to print results
#
PrintDT <- function(data, pagelength, caption, digits) {

  data <- data %>% mutate(across(where(is.numeric), round, digits))

  DT::datatable(data,
                filter = 'top',
                caption = caption,
                options = list(
                  pageLength = pagelength,
                  autoWidth = TRUE,
                  initComplete = JS(
                    "function(settings, json) {",
                    "$('body').css({'font-family': 'Arial'});",
                    "}"
                  )))
}
