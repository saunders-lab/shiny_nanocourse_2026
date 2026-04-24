# -------------------------------------------------------------------------#
# SHINY EXERCISE 
# -------------------------------------------------------------------------#
#  Lecture 1, Simple Plot App
#
#  GOAL: Explore a very simple functional app.
#    -Does it run and interact properly?
#.   -Change the inputId in the UI and server
#
#  What’s provided:
#    -A fully functional app is provided.
#
#  How to proceed:
#    1. Fill in *TODO-1* and *TODO-2* to change the inputId.
#    2. Click “Run App” and test after each step.
#
#  Have fun and watch the app come to life!
# -------------------------------------------------------------------------#

library(shiny)
library(bslib)
library(tidyverse)

ui <- page_fluid(
  
  ### TODO-1: Change the inputId in the UI
  sliderInput(inputId = "slide_1", #update "slide_1" to a new name of your choice (e.g. "slide_2").
              label = 'Where should the line go?',
              min = 1, 
              max = 1000,
              value = 10),
  
  plotOutput("plot_1")
  
  
)

server <- function(input, output) {
  
  output$plot_1 <- renderPlot({ 
    
    tibble(x = c(1, 10, 50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000), y = c(0, 3, 7, 10, 9, 6, 5, 4, 3, 2, 1, 0.5, 0.25)) %>% 
    ggplot( aes(x = x, y = y))+
      geom_smooth(se = F)+
      ### TODO-2: Change the inputId in the server
      geom_vline(xintercept = input$slide_1, linewidth = 2, linetype = 2) + #update input$slide_1 to the new name of your choice (e.g. input$slide_2).
      scale_x_log10(limits = c(1,1000)) + 
      ylim(0,10) + 
      theme_classic() + 
      labs(x = 'Lines of code in Shiny app', y = 'Happiness')
    
  }) 
  
}

shinyApp(ui = ui, server = server)