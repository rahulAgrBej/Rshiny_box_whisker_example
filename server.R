
library(tidyverse)

source('boxWhiskerGenerate.R')

getData <- function(pathToFile) {
  data <- read_csv(pathToFile)
  return(data)
}

server <- function(input, output) {
  
  dataInput <- reactive({
    getData('Islas_seedRain_trapLevel.csv')
  })
  
  # sends the box whisker plots to UI
  output$boxWhiskerRender <- renderPlot({
    boxWhiskerCreate( # creates the box whisker plots
      dataInput(),
      input$succession_stage_id)
  })
}