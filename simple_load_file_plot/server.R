#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  load <- eventReactive(input$run, {
    inFile <- input$input_file_data
    
    if (is.null(inFile))
      return(NULL)
    
    return(inFile$datapath)
  })
   
  data <- reactive({
    read.delim(load(), header = input$header)
  })
  
  output$contents <- renderTable({
    data()
  })
  
  output$plot <- renderPlot({
    d <- data()
    plot(d[,1])
  })
})
