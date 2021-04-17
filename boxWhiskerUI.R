

boxWhiskerTab <- tabItem(
  tabName ='boxWhiskers',
  fluidRow(
    box(
      h1('Box and Whisker Plot Page'),
      'Description of box plot',
      selectInput(inputId='succession_stage_id',
                  label='Successional Stage Filter',
                  choices=c('All', 'Early', 'Late', 'Both'),
                  selected=c('All')),
      selectInput(inputId='growth_form_id',
                  label='Growth Form Filter',
                  choices=c('Test1', 'test2', 'test3'),
                  selected=c('test2')),
      selectInput(inputId='growth_form_idx',
                  label='Dispersal Mode Filter',
                  choices=c('Test1', 'test2', 'test3'),
                  selected=c('test2'))
    ),
    box(
      h1('Plot Output below'),
      plotOutput('boxWhiskerRender') # receives box whisker plot that server sent
      
    )
  )
)
