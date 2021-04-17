
library(tidyverse)

boxWhiskerCreate <- function(data_input, succession_stage_id) {
  
  # data cleaning and counting all wind and animal dispersal
  print(data_input)
  
  processed_data <- data_input
  
  # rename the tree types to just Tree
  processed_data <- processed_data %>%
    mutate(Growthform=replace(Growthform, Growthform=='CT', 'Tree'))
    
  
  # because of the huge difference in outlier values round 4000-6000
  # check if these are valid
  processed_data <- processed_data %>%
    filter(depositionRate < 10)
  
  if (succession_stage_id != 'All') {
    processed_data <- processed_data %>%
      filter(str_detect(SuccessionalStage, succession_stage_id))
  }
  
  print(processed_data)
  
  #data_input <- data_input %>%
  #  group_by(Plot, Treatment) %>%
  #  count(Dispersalmode)
  
  #print(data_input)
  #print(x_axis_input)
  
  processed_data <- processed_data%>%
    mutate(Treatment = factor(
      Treatment,
      levels=c('C', 'I', 'P', 'R'),
      labels=c('Nat_reg', 'App_nuc', 'Plantation', 'Ref_for')
    ))
  
  p <- ggplot(processed_data, aes(x=Treatment, y=depositionRate)) + 
    geom_boxplot()# +
    #facet_grid(~Treatment)
  
  return(p)
}