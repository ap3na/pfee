#----------------------------------------------------------
# two vertical axis plot function 
# vertical axis with same scale
# 
TwoVerticalSameScalePlot <- function(.da1, x, y1, y2, Field) {
  x <- enquo(x)
  y1 <- enquo(y1)
  y2 <- enquo(y2)
  # plot results
  ggplot(.da1, aes(!!x, !!y1)) +
    geom_point(size = 1., 
               colour = "#547d5f") +
    geom_line(data = .da1,
              aes(y = !!y2), 
              colour = "#1bd14c", 
              size = 1.) +
    facet_wrap(~well_name, ncol = 3, scales = "free", shrink = T) + 
    theme(axis.text.x = element_text(angle = 0, hjust = 1)) +
    labs(
      title = 
        toupper(Field),      
      subtitle = 
        paste(""),
      caption = "",
      x = "Time (years)", 
      y = "bpd (mbd)") +
    theme_bw()
}
