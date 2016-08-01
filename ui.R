#
# This is the user-interface definition of a Shiny 
# web application that illustrates the effect of noise on a signal.
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that illustrates the effect of noise on the signal
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Signal through the noise"),

  # Sidebar with three sliders: 
  # - the number of points to fit 
  # - the mean of the noise 
  # - the standard deviation of the noise
  sidebarLayout(
    sidebarPanel(
      sliderInput("n",
                   label = HTML("Number of points to use (n):"),
                   min = 0,
                   max = 1000,
                   step = 2,
                   value = 100),
       sliderInput("avg",
                   label = HTML("Mean value of noise (&mu;):"),
                   min = 0,
                   max = 1,
                   step = 0.1,
                   value = 0),
       sliderInput("std",
                   label = HTML("Standard deviation of noise (&sigma;):"),
                   min = 0,
                   max = 3,
                   step = 0.1,
                   value = 0.2)
    ),
    
    # Provide instructions and make the plot
    mainPanel(
      
      # First section
      h3("Objective"),
      p("This is an instructional app which illustrates the effect of noise on a linear model."),
      
      # Second section
      h3("Instructions"),
      p("We are using a linear model of noisy measurements to fit the signal:"),
      withMathJax("$$y_i=x_i + \\varepsilon_i \\qquad \\text{for}~i = 1,\\dots,n$$"),
      p("The user chooses the number of points (n) and the mean and standard deviation of the noise:"),
      withMathJax("$$ \\varepsilon_i  = \\mathcal{N}(\\mu, \\sigma) \\qquad \\text{for}~i = 1,\\dots,n$$"),

      # Third section
      h3("Results of the linear model"),
      textOutput("text"),
      plotOutput("distPlot")
    )
  )
))
