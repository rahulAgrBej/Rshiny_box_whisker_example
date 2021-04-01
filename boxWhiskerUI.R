
boxWhiskerTab
boxWhiskerTab <- tabItem(
  tabName ='boxWhiskers',
  fluidRow(
    box(
      h1('Box and Whisker Plot Page'),
      'Description of box plot',
      selectInput(inputId='x_axis',
                  label='LABEL FOR X AXIS',
                  choices=c('Test1', 'test2', 'test3'),
                  selected=c('test2'))
    ),
    box(
      h1('Plot Output below'),
      plotOutput('boxWhiskerRender') # receives box whisker plot that server sent
      
    )
  )
)
