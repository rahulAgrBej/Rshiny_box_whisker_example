
library(tidyverse)

boxWhiskerCreate <- function(data_input, succession_stage_id) {
  
  # data cleaning and counting all wind and animal dispersal
  print(data_input)
  
  processed_data <- data_input
  
  if (succession_stage_id != 'All') {
    processed_data <- data_input %>%
      filter(str_detect(SuccessionalStage, succession_stage_id))
  }
  
  print(processed_data)
  
  #data_input <- data_input %>%
  #  group_by(Plot, Treatment) %>%
  #  count(Dispersalmode)
  
  #print(data_input)
  #print(x_axis_input)
    
  
  p <- ggplot(data_input, aes(x=Dispersalmode, y=n)) + 
    geom_boxplot() +
    facet_grid(~Treatment)
  
  return(p)
}