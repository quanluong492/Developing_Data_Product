
library(shiny)

customer_data <- read.csv("Wholesale customers data.csv", stringsAsFactors = F)
pageWithSidebar(
  headerPanel('Customers k-means clustering'),
  sidebarPanel(
    selectInput('xvar', 'X Variable', names(customer_data)),
    selectInput('yvar', 'Y Variable', names(customer_data),
                selected=names(customer_data)[[2]]),
    sliderInput('clusters', 'Number of Clusters', 3,
                 min = 1, max = 10)
  ),
  mainPanel(
    plotOutput('plot1')
  )
)