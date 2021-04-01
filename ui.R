
library(shiny)
library(shinydashboard)
library(shinyWidgets)

source('overviewUI.R')
source('boxWhiskerUI.R')

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem('Overview', tabName='overview'),
    menuItem('Box and Whisker Plot', tabName='boxWhiskers')
  )
)

body <- dashboardBody(
  
  tabItems(
    overviewTab,
    boxWhiskerTab
  )
)

dashboardPage(
  dashboardHeader(title='Box and Whisker Plots'),
  sidebar,
  body
)