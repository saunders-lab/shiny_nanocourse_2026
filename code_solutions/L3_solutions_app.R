library(shiny)

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

server <- function(input, output, session) {
  
  # 1. Reactive: clean the sequence whenever input changes
  clean_seq <- reactive({
    req(input$sequence)
    
    seq <- toupper(input$sequence)
    seq <- gsub("[^ATGC]", "", seq)
    
    req(nchar(seq) > 0)
    seq
  })
  
  # 2. eventReactive: run analysis only when button is clicked
  analysis <- eventReactive(input$run_btn, {
    seq <- clean_seq()
    bases <- strsplit(seq, "")[[1]]
    
    list(
      length = length(bases),
      gc = round(mean(bases %in% c("G", "C")) * 100, 1),
      counts = table(bases)
    )
  })
  
  # 3. renderText: print summary
  output$summary_text <- renderText({
    result <- analysis()
    
    paste(
      "Length:", result$length, "bp",
      "| GC content:", result$gc, "%"
    )
  })
  
  # 4. renderPlot: plot base counts
  output$base_plot <- renderPlot({
    result <- analysis()
    
    barplot(
      result$counts,
      main = "Base counts",
      xlab = "Base",
      ylab = "Count"
    )
  })
  
  # 5. observeEvent: show message after button click
  observeEvent(input$run_btn, {
    showNotification("Analysis completed!")
  })
}

shinyApp(ui, server)