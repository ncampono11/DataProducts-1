#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$text <- renderText({ 
    paste("A simple measure of the quality of the fit is the R-squared value, which is",
          input$n,
          "here. The closer it is to 1, the better you will be able to predict the signal (and vice-versa for 0). The astute user will notice that changing the mean of the noise just shifts the data in the y-direction.")
  })
  
  output$distPlot <- renderPlot({
    
    # Set the seed
    set.seed(42)
    
    # Initialize the data
    x <- seq(0,1,length=input$n)
    noise <- rnorm(input$n, mean = input$avg, sd = input$std)
    y <- x + noise
    
    # put these in a dataframe
    x_name <- "x"
    y_name <- "y"
    df <- data.frame(x,y)
    names(df) <- c(x_name,y_name) 

    # Linear regression
    fit <- lm(y ~ x, data = df)

    # draw the histogram with the specified number of bins
    p <- ggplot(df, aes(x,y)) +
      geom_point() +
      geom_smooth(method = "lm", se = FALSE)
    p

  })
  
})
