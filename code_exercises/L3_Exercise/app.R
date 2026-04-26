library(shiny)

# ------------------------------------------------------------
# Lecture Exercise: DNA Sequence Analyser
# Goal: practice reactive(), eventReactive(), renderText(),
# renderPlot(), observeEvent(), and req()
# ------------------------------------------------------------

ui <- fluidPage(
  
  titlePanel("DNA Sequence Analyser"),
  
  sidebarLayout(
    
    sidebarPanel(
      textAreaInput(
        "sequence",
        "Paste DNA sequence:",
        value = "ATGCGGCTAATGC",
        rows = 4
      ),
      
      actionButton("run_btn", "Analyse")
    ),
    
    mainPanel(
      h3("Results"),
      textOutput("summary_text"),
      plotOutput("base_plot")
    )
  )
)

#------------------------------ TODO: Fill in the server function ------------------------------#

server <- function(input, output, session) {
  
  # ----------------------------------------------------------
  # TODO 1: Create a reactive expression called clean_seq
  #
  # This reactive should:
  # - check that input$sequence exists using req()
  # - convert the sequence to uppercase using toupper()
  # - remove characters that are not A, T, G, or C using gsub()
  # - check that the cleaned sequence is not empty using req()
  # - return the cleaned sequence
  #
  # Hint:
  # clean_seq <- reactive({
  #   req(input$sequence)
  #   seq <- toupper(input$sequence)
  #   seq <- gsub("[^ATGC]", "", seq)
  #   req(nchar(seq) > 0)
  #   seq
  # })
  # ----------------------------------------------------------
  
  clean_seq <- 
    
    # write your code here
    
  
  
  
  # ----------------------------------------------------------
  # TODO 2: Create an eventReactive called analysis
  #
  # This should run ONLY when the Analyse button is clicked.
  #
  # Inside eventReactive:
  # - get the cleaned sequence using clean_seq()
  # - split the sequence into single bases using strsplit()
  # - calculate the length
  # - calculate GC content
  # - count the bases
  # - return these values in a list
  #
  # Hint:
  # analysis <- eventReactive(input$run_btn, {
  #   seq <- clean_seq()
  #   bases <- strsplit(seq, "")[[1]]
  #   
  #   list(
  #     length = length(bases),
  #     gc = round(mean(bases %in% c("G", "C")) * 100, 1),
  #     counts = table(bases)
  #   )
  # })
  # ----------------------------------------------------------
  
  analysis <- 
    
    # write your code here
    
  })
  
  
  # ----------------------------------------------------------
  # TODO 3: Create text output
  #
  # Use renderText() to print:
  # Length: X bp | GC content: Y %
  #
  # You need to:
  # - get the result from analysis()
  # - use paste() to create the text
  #
  # Hint:
  # output$summary_text <- renderText({
  #   result <- analysis()
  #   
  #   paste(
  #     "Length:", result$length, "bp",
  #     "| GC content:", result$gc, "%"
  #   )
  # })
  # ----------------------------------------------------------
  
  output$summary_text <- 
    
    # write your code here
    
  })
  
  
  # ----------------------------------------------------------
  # TODO 4: Create plot output
  #
  # Use renderPlot() and barplot() to show the base counts.
  #
  # You need to:
  # - get the result from analysis()
  # - plot result$counts
  #
  # Hint:
  # output$base_plot <- renderPlot({
  #   result <- analysis()
  #   
  #   barplot(
  #     result$counts,
  #     main = "Base counts",
  #     xlab = "Base",
  #     ylab = "Count"
  #   )
  # })
  # ----------------------------------------------------------
  
  output$base_plot <-
    
    # write your code here
    
  })
  
  
  # ----------------------------------------------------------
  # TODO 5: Create an observer
  #
  # Use observeEvent() to show a notification when the user
  # clicks the Analyse button.
  #
  # Hint:
  # observeEvent(input$run_btn, {
  #   showNotification("Analysis completed!")
  # })
  # ----------------------------------------------------------
  
  observeEvent
    
    # write your code here
    
  })
}

shinyApp(ui, server)