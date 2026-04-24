# -------------------------------------------------------------------------#
# SHINY EXERCISE 
# -------------------------------------------------------------------------#
#  Lecture 1, Simple Dataframe App
#
#  GOAL: Explore a very simple functional app.
#    -Does it run and interact properly?
#.   -Add an option to the select input.
#
#  What’s provided:
#    -A fully functional app is provided.
#
#  How to proceed:
#    1. Fill in *TODO-1* to add a new select option.
#    2. Click “Run App” and test after each step.
#
#  Have fun and watch the app come to life!
# -------------------------------------------------------------------------#

library(shiny)
library(bslib)
library(tidyverse)

ui <- page_fluid(
  
  ### TODO-1: Add another species that exists in the dataframe.
  # Hint - you can run starwars in your console to see the whole df.
  selectInput(inputId = "select_1",
              label = 'Choose a species!',
              choices = c('Human','Droid','Wookiee')), # Here, add another option (e.g. 'Gungan', 'Kaminoan')
  
  tableOutput("table_1")
  
  
)

server <- function(input, output) {
  
  output$table_1 <- renderTable({ 
    
    starwars %>% 
      select(-films, -vehicles, -starships) %>% 
      filter(species == input$select_1)
    
    }) 

  }

shinyApp(ui = ui, server = server)