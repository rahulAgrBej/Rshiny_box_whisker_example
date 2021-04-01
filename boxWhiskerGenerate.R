
library(tidyverse)

boxWhiskerCreate <- function(data_input, x_axis_input) {
  
  # data cleaning and counting all wind and animal dispersal
  
  data_input <- data_input %>%
    group_by(Plot, Treatment) %>%
    count(Dispersalmode)
  
  print(data_input)
  print(x_axis_input)
    
  
  p <- ggplot(data_input, aes(x=Dispersalmode, y=n)) + 
    geom_boxplot() +
    facet_grid(~Treatment)
  
  return(p)
}