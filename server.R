library(shiny)
customer_data <- read.csv("Wholesale customers data.csv", stringsAsFactors = F)
function(input, output, session) {
  
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    customer_data[, c(input$xvar, input$yvar)]
  })
  
  clusters <- reactive({
    kmeans(selectedData(), input$clusters)
  })
  
  output$plot1 <- renderPlot({
    
    par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData(),
         col = clusters()$cluster,
         pch = 20, cex = 3)
    points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
  })
  
}