#----------------------------------------------------------
# ProductionByWellsPlot function   
# 
ProductionByWellsPlot <- function(data, Field) {
  
  # plot results
  ggplot(data, aes(date, q, colour = "q")) +
    geom_line(size = 1.4) +
    geom_line(data = data, aes(y = qf, colour = "qf"),
              size = 1.2) +
    facet_wrap(~well_name, ncol = 3, scales = "free", shrink = T) + 
    theme(axis.text.x = element_text(angle = 0, hjust = 1)) +
    labs(title = paste("Field", toupper(Field)),
         subtitle = paste("q & qf daily production"),
         caption = "Euler Energy",
         x = "Time (years)", 
         y = "bpd (mbd)") +
    theme(legend.position = "top") +
    ScaleColourDiscrete() +
    guides(color = guide_legend("Legend"))
}
