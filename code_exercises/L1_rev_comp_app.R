# -------------------------------------------------------------------------#
# SHINY EXERCISE 
# -------------------------------------------------------------------------#
#  Lecture 1, Simple DNA App
#
#  GOAL: Explore a very simple functional app.
#    -Does it run and interact properly?
#.   -Change the output to be verbatim text that looks like code.
#
#  What’s provided:
#    -A fully functional app is provided.
#
#  How to proceed:
#    1. Fill in *TODO-1* and *TODO-2* to change the output style.
#    2. Click “Run App” and test after each step.
#
#  Have fun and watch the app come to life!
# -------------------------------------------------------------------------#

library(shiny)
library(bslib)
#library(tidyverse)
library(bioseq)

ui <- page_fluid(
  textAreaInput(inputId = "seq_1",
                label = 'DNA seq plz',
                value = 'AATTCCGG'),
  
  ### TODO-1: Change textOutput to verbatimTextOutput
  textOutput("rev_comp_1")
  
  
)

server <- function(input, output) {
  
  ### TODO-2: Change renderText to renderPrint
  output$rev_comp_1 <- renderText({ seq_complement(seq_reverse(dna(input$seq_1))) }) 
  
}

shinyApp(ui = ui, server = server)