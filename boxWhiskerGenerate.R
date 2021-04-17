
library(tidyverse)

boxWhiskerCreate <- function(data_input, succession_stage_id) {
  
  print(data_input)
  
  processed_data <- data_input
  
  # rename the tree types to just Tree
  processed_data <- processed_data %>%
    mutate(Growthform=replace(Growthform, Growthform=='CT', 'Tree')) %>%
    mutate(Growthform=replace(Growthform, Growthform=='CP', 'Tree')) %>%
    mutate(Growthform=replace(Growthform, Growthform=='UT', 'Tree')) %>%
    mutate(Growthform=replace(Growthform, Growthform=='UP', 'Tree')) %>%
    mutate(Growthform=replace(Growthform, Growthform=='ET', 'Tree'))
    
  
  # because of the huge difference in outlier values round 4000-6000
  # check if these are valid
  processed_data <- processed_data %>%
    filter(depositionRate < 10)
  
  if (succession_stage_id != 'All') {
    processed_data <- processed_data %>%
      filter(str_detect(SuccessionalStage, succession_stage_id))
  }
  
  print(processed_data)
  
  # renaming the treatment groups to their actual names
  processed_data <- processed_data %>%
    mutate(Treatment = factor(
      Treatment,
      levels=c('C', 'I', 'P', 'R'),
      labels=c('Nat_reg', 'App_nuc', 'Plantation', 'Ref_for')
    ))
  
  p <- ggplot(processed_data, aes(x=Treatment, y=depositionRate)) + 
    geom_boxplot()
  
  return(p)
}